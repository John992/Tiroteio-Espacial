extends ParallaxBackground

@onready var parallax = $ParallaxLayer
@onready var parallax2 = $ParallaxLayer2
@onready var parallax3 = $ParallaxLayer3

func _process(delta):
	parallax.motion_offset.y += 10 * delta
	parallax2.motion_offset.y += 50 * delta
	parallax3.motion_offset.y += 100 * delta
