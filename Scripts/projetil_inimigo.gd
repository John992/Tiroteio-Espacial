extends Area2D

const SPEED = 400.0

var direction = Vector2.DOWN

func _physics_process(delta):
	translate(direction * SPEED * delta)
	
	if position.y > 740:
		queue_free()

func _on_body_entered(body):
	if body.is_in_group("Player"):
		body.queue_free()
