extends Area2D

@export var projetil : PackedScene

const SPEED = 100.0

var direction = Vector2.DOWN
var podeAtirar = true

func _physics_process(delta):
	translate(direction * SPEED * delta)
	disparar()
	
	if position.y > 740:
		queue_free()
		

func disparar():
	if podeAtirar:
		var projetil_instancia = projetil.instantiate()
		projetil_instancia.global_transform = $Marker2D.global_transform
		get_parent().add_child(projetil_instancia)
		podeAtirar = false
		$Timer.start()
		$AudioStreamPlayer2D.play()

func _on_timer_timeout():
	podeAtirar = true
