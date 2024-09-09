extends Area2D

const SPEED = 400.0

var direction = Vector2.UP # O projétil do jogador vai para cima, por isso recebe Vector2.UP, que é igual a (0, -1)

func _physics_process(delta):
	translate(direction * SPEED * delta) # É utilizado a função translate para deslocar o projétil, visto que não possui a propriedade velocity. Multiplicar por delta garante que o movimento seja consistente, independentemente da taxa de quadros do jogo
	
	if position.y < 0:
		queue_free() # Se o projétil sair da tela, retiramos da cena usando queue_free()

func _on_area_entered(area): # Sinal oriundo do nó Area2D, no momento em que outra Area entrar em contato, a função é chamada
	if area.is_in_group("Inimigo"): # O parâmetro area é o nó de área que entrou em contato com o objeto. Utilizamos a função is_in_group para verificar se o objeto pertence ao seguinte grupo
		get_parent().pontos += 100 # Adiciona 100 pontos ao contador de pontos do nó pai do objeto, que é onde está guardado a variável pontos
		area.queue_free() # Remove o inimigo que foi atingido pelo projétil
		queue_free() # Remove o projétil da cena após atingir um inimigo
