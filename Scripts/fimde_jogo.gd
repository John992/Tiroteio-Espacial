extends CanvasLayer

func _ready(): # método próprio da godot que roda uma vez no momento em que o nó é adicionado na cena
	visible = false # Inicia invisível

func _process(delta):
	if visible: # No momento em que for visível (jogador perdeu), é executado:
		$VBoxContainer/Reiniciar.grab_focus() # Com o grab_focus, o botão fica selecionado, permitindo que o usuário selecione via teclado/controle, sem necessidade do uso do mouse
		get_tree().paused = true # Pausamos a árvore de cenas, lembrando que o modo de processo da cena de fim de jogo deve estar em Always, para evitar pausar junto ao restante do jogo

func _on_reiniciar_pressed(): # Sinal oriundo do nó button, a função é chamada no momento em que o jogador aperta no botão reiniciar
	get_tree().paused = false # Despausamos o jogo
	get_tree().reload_current_scene() # Reiniciamos a árvore de cenas
