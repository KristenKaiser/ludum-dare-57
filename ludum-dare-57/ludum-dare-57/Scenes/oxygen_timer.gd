extends Timer
var ui_time : int = -1


func _process(delta: float) -> void:
	update_ui()
	
func update_ui()->void:
	var time = int(floor(time_left))
	if ui_time != time:
		ui_time = time
		Manager.hud.update_oxygen_timer(time)
