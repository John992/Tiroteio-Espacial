extends CharacterBody2D

@export var projetil : PackedScene

const SPEED = 300.0

var podeAtirar = true

func _physics_process(delta):
	limitarPosicao()
	
	var direction = Input.get_axis("MoverEsquerda", "MoverDireita")
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	if Input.is_action_just_pressed("Disparo"):
		disparar()
	
	move_and_slide()

func limitarPosicao():
	position.x = clamp(position.x, 40, 440)
	
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
