extends CharacterBody2D

@export var projetil : PackedScene # Variável disponível para ser editada através do inspetor, será usada para instanciar a cena de projétil 

const SPEED = 300.0 # Declaração da constante de velocidade

var podeAtirar = true # Declaração de variável para controlar se o jogador pode atirar ou não

func _physics_process(delta): # Função própria da godot, é executada a uma taxa fixa (60 por segundos por padrão). É independente da taxa de quadros, por isso é recomendado para o uso de física e colisões
	limitarPosicao()
	
	var direction = Input.get_axis("MoverEsquerda", "MoverDireita") # Direction guarda a direção que o jogador está apertando, retorna -1 caso aperte para esquerda, 1 caso aperte para direita e 0 caso nenhum dos dois esteja pressionado
	
	if direction: # Caso direction tenha um valor diferente de 0, a linha de comando é executada
		velocity.x = direction * SPEED # velocity é uma propriedade do characterbody2D, é um vetor que determina o quão rápido e em que direção o objeto se move. Nessa linha estamos controlando o eixo horizontal (esquerda, direita)
	else: # Caso direction seja 0, utilizamos move_toward para desacelerar o objeto. O primeiro parâmetro é o valor atual, o segundo é o valor-alvo e o terceiro é a taxa de desaceleração
		velocity.x = move_toward(velocity.x, 0, SPEED)

	if Input.is_action_just_pressed("Disparo"): # É verificado se o jogador apertou o botão de disparo
		disparar()
	
	move_and_slide() # Move o corpo baseado no velocity, lida com colisões e deslizamentos (para mover suavemente) do objeto

func limitarPosicao(): # Função utilizada para impedir o jogador de sair da tela
	position.x = clamp(position.x, 40, 440) # A função clamp limita a posição no eixo X entre um valor mínimo e máximo. O primeiro parâmetro é o valor limitado, o segundo é o valor mínimo e o terceiro o valor máximo
	
func disparar():
	if podeAtirar: 
		var projetil_instancia = projetil.instantiate() # Armazenamos na variável uma cópia(instância) da cena projetil
		projetil_instancia.global_transform = $Marker2D.global_transform # Definimos a posição, rotação e escala da cópia. No caso, será o mesmo que o Marker2D
		get_parent().add_child(projetil_instancia) # Adicionamos a instância do projétil como um nó filho do nó pai atual (Player). Assim, o projétil entra na árvore de cena e fica visível e ativo no jogo.
		podeAtirar = false # podeAtirar recebe o valor falso, impedindo que o jogador atire novamente de imediato
		$Timer.start() # Iniciamos o temporizador
		$AudioStreamPlayer2D.play() # Reproduz o som de tiro

func _on_timer_timeout(): # Sinal oriundo do nó Timer, no momento em que o tempo for encerrado, a função é chamada
	podeAtirar = true
