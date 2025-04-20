extends Label

var isworking = false
signal done_fishing

# Called when the node enters the scene tree for the first time.
func _ready():
	text = str(global.save.work_time_min)
	audio_manager.play_sound(load("res://Assets/Audio/wind-and-waves-307526.mp3"),true)
	
	
func _on_tacklebox_work_started():
	isworking = true
	$Timer.wait_time = global.save.work_time_min * 60
	$Timer.start()
	
func _process(delta):
	text = format_seconds($Timer.time_left)
	$date.text = Time.get_datetime_string_from_system().split("T")[0]
	$clock.text = Time.get_datetime_string_from_system().split("T")[1]
	$money.text = "$"+str(global.save.money)
	$ProgressBar.value = global.save.xp
	$ProgressBar.max_value = (global.save.level + 1) * 100
	$ProgressBar.min_value = global.save.level * 100
	
func format_seconds(seconds: int) -> String:
	var minutes = seconds / 60
	var secs = seconds % 60
	return "%02d:%02d" % [minutes, secs]

func _on_timer_timeout():
	if isworking:
		isworking = false
		done_fishing.emit()
		$Timer.wait_time = global.save.rest_time_min * 60
		$Timer.start()
