extends Node2D

@export var inimigo : PackedScene

var pontos = 0
var lista_tempos = [1.0, 1.5, 2.0]
var lista_locais = []
var podeSurgir = true

func _ready():
	for filho in $Surgimento.get_children():
		lista_locais.append(filho)

func _process(delta):
	surgirInimigo()
	$Pontuacao/Pontos.set_text(str(pontos))
	
	if not $Player:
		$FimdeJogo.visible = true

func surgirInimigo():
	if podeSurgir:
		var inimigo_instacia = inimigo.instantiate()
		inimigo_instacia.global_transform = (lista_locais.pick_random()).global_transform
		get_node("Inimigos").add_child(inimigo_instacia)
		podeSurgir = false
		await get_tree().create_timer(lista_tempos.pick_random()).timeout
		podeSurgir = true
