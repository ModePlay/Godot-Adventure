extends RigidBody2D

var sfx_control = 7

func _on_body_entered(body):
	if abs(self.linear_velocity.x)>sfx_control or abs(self.linear_velocity.y)>sfx_control:
		$AudioStreamPlayer.play()


func _on_audio_stream_player_finished():
	pass
