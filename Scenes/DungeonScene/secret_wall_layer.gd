extends TileMapLayer

func _on_switch_switch_activated():
	disable_secret_wall()

func _on_switch_switch_deactivated():
	enable_secret_wall()
	
func enable_secret_wall():
	visible = true
	collision_enabled = true

func disable_secret_wall():
	visible = false
	collision_enabled = false
