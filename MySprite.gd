extends Sprite2D


func _ready():
	print('Hello, World!')
	rotation_degrees = 45
	position.x = -100
	
func _process(delta):
	rotation_degrees += 1
	position.x += 1
