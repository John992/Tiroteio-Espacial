extends CanvasLayer

func _ready():
	visible = false

func _process(delta):
	if visible:
		$VBoxContainer/Reiniciar.grab_focus()
		get_tree().paused = true

func _on_reiniciar_pressed():
	get_tree().paused = false
	get_tree().reload_current_scene()
