extends Area2D

const SPEED = 400.0

var direction = Vector2.UP 

func _physics_process(delta):
	translate(direction * SPEED * delta)
	
	if position.y < 0:
		queue_free()

func _on_area_entered(area):
	if area.is_in_group("Inimigo"):
		get_parent().pontos += 100
		area.queue_free()
		queue_free()
