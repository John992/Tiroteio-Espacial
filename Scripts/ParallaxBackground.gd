extends ParallaxBackground

# onready é um modificador que garante que a variável será declarada quando o nó estiver pronto (carregado), o que é útil para evitar problemas ao acessar nós na árvore de cena.
@onready var parallax = $ParallaxLayer
@onready var parallax2 = $ParallaxLayer2
@onready var parallax3 = $ParallaxLayer3

func _process(delta): # método próprio da godot, é chamada a cada frame (varia de acordo com o desempenho da máquina)
	# Cada camada se move em velocidades diferentes para simular o efeito parallax, o delta é utilizado para garantir a suavidade do movimento, visto que delta guarda o tempo desde o último frame
	parallax.motion_offset.y += 10 * delta
	parallax2.motion_offset.y += 50 * delta
	parallax3.motion_offset.y += 100 * delta
