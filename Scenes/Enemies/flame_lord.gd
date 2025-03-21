extends CharacterBody2D
class_name FlameLord

@export var speed: float = 20
@export var acceleration: float = 5
@export var HP: int = 10

var target: Node2D

func _physics_process(delta: float) -> void:
	if HP <= 0:
		return
	chase_target()

	animate_enemy()
	
	move_and_slide()
		
func chase_target():
	if target:
		var distance_to_player: Vector2
		distance_to_player = target.global_position - global_position
		
		var direction_normal: Vector2 = distance_to_player.normalized()
		
		velocity = velocity.move_toward(direction_normal * speed, acceleration)
		
func animate_enemy():
	var normal_velocity: Vector2 = velocity.normalized()
	
	if normal_velocity.x == 0:
		$AnimatedSprite2D.play("default")
	
	elif normal_velocity.x > 0.707:
		$AnimatedSprite2D.play("move_right")
	elif normal_velocity.x < -0.707:
		$AnimatedSprite2D.play("move_left")
	elif normal_velocity.y > 0.707:
		$AnimatedSprite2D.play("move_down")
	elif normal_velocity.y < 0.707:
		$AnimatedSprite2D.play("move_up")
	
	Vector2(10, 10).normalized()
	Vector2(11,10).normalized()
	Vector2(10, -11).normalized()


func _on_detection_area_2d_body_entered(body: Node2D) -> void:
	
	if body is Cyclops:
		target = body
		
	if body is Player:
		target = body
		
