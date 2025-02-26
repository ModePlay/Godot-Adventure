extends CharacterBody2D

@export var move_speed: float = 100

# Called when the node enters the scene tree for the first time.
func _ready():
	var first_name: String = "Mode"
	var damage: float = 7.5
	
	if damage >= 5:
		print("Ouch!")
	
	print(first_name)
	print(damage)
	print(move_speed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var move_vector: Vector2 = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	
	velocity = move_vector * move_speed
	
	if velocity.x > 0:
		print("The player is moving right.")
		$AnimatedSprite2D.play("move_right")
		
	elif velocity.x < 0:
		print("The player is moving left.")
		$AnimatedSprite2D.play("move_left")
		
	elif velocity.y < 0:
		print("The player is movin' on up.")
		$AnimatedSprite2D.play("move_up")
		
	elif velocity.y > 0:
		print("The player is movin' on down.")
		$AnimatedSprite2D.play("move_down")
		
	else: 
		print("The player ain't moving.")
		$AnimatedSprite2D.stop()
	
	move_and_slide()
