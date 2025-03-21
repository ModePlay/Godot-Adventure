extends StaticBody2D

@export var dialogue_lines: Array[String] = ["Arrivederci!", "Git'Outta here!", "Whadda ya want?"]
var dialogue_index: int = 0

var can_interact: bool = false

func _process(delta):
	if Input.is_action_just_pressed("interact") and can_interact:
		$AudioStreamPlayer2D.play()
		if dialogue_index < dialogue_lines.size():
			$CanvasLayer.visible = true	
			get_tree().paused = true
			
			$CanvasLayer/DialogueLabel.text = (dialogue_lines[dialogue_index])
			dialogue_index += 1
			
		else:
			$CanvasLayer.visible = false
			get_tree().paused = false
			dialogue_index = 0
		
