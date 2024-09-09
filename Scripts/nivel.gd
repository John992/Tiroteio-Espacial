extends Node2D

@export var inimigo : PackedScene

var pontos = 0 # Armazena a pontuação do jogador
var lista_tempos = [1.0, 1.5, 2.0] # Lista dos tempos (em segundos) que determinam quando os inimigos irão surgir
var lista_locais = [] # Lista de locais onde os inimigos poderão surgir
var podeSurgir = true # Declaração de variável para controlar se os inimigos podem surgir ou não

func _ready():
	for filho in $Surgimento.get_children(): # Adicionamos os filhos do nó chamado Surgimento na lista de locais
		lista_locais.append(filho)

func _process(delta):
	surgirInimigo()
	$Pontuacao/Pontos.set_text(str(pontos)) # Atualiza o texto da pontuação exibida na tela através do nó Label
	
	if not $Player: # Caso o Jogador não esteja na árvore de cenas (perdeu)
		$FimdeJogo.visible = true # A tela de fim de jogo torna-se visível

func surgirInimigo():
	if podeSurgir:
		var inimigo_instacia = inimigo.instantiate()
		inimigo_instacia.global_transform = (lista_locais.pick_random()).global_transform
		get_node("Inimigos").add_child(inimigo_instacia)
		podeSurgir = false
		await get_tree().create_timer(lista_tempos.pick_random()).timeout
		podeSurgir = true
