extends StaticBody2D

signal switch_activated
signal switch_deactivated

var can_interact: bool = false
var is_activated: bool = false

func _process(delta):
	if Input.is_action_just_pressed("interact") and can_interact:
		if is_activated:
			deactivate_switch()
		else:
			activate_switch()

			
func activate_switch():
	$AnimatedSprite2D.play("activated")
	$AudioStreamPlayer2D.pitch_scale = 1
	$AudioStreamPlayer2D.play()
	switch_activated.emit()
	is_activated = true

func deactivate_switch():
	$AnimatedSprite2D.play("deactivated")
	$AudioStreamPlayer2D.pitch_scale = 0.8
	$AudioStreamPlayer2D.play()
	switch_deactivated.emit()
	is_activated = false
