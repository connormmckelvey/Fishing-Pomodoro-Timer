extends Label

var hover_amplitude := 5.0
var hover_speed := 2.0
var base_y := 0.0
var hover_offset := 0.0

var isworking = false
signal done_fishing

# Called when the node enters the scene tree for the first time.
func _ready():
	text = str(global.save.work_time_min)
	audio_manager.play_sound(load("res://Assets/Audio/wind-and-waves-307526.mp3"),true)
	$HBoxContainer.hide()
	base_y = $"icons/Fishing-pole".position.y
	
func _on_tacklebox_work_started():
	isworking = true
	$Timer.wait_time = global.save.work_time_min * 60
	$Timer.start()
	
func _process(delta):
	text = format_seconds($Timer.time_left)
	$date.text = Time.get_datetime_string_from_system().split("T")[0]
	$clock.text = Time.get_datetime_string_from_system().split("T")[1]
	$money.text = "$"+str(global.save.money)
	$level.text = str(global.save.level)
	$ProgressBar.value = global.save.xp
	$ProgressBar.max_value = (global.save.level + 1) * 100
	$ProgressBar.min_value = global.save.level * 100
	if Input.is_action_just_released("left click") and get_rect().has_point(get_global_mouse_position()):
		if $HBoxContainer.visible:
			$HBoxContainer.hide()
		else:
			$HBoxContainer.show()
	var time := Time.get_ticks_msec() / 1000.0
	var y_offset := sin((time + hover_offset) * hover_speed) * hover_amplitude
	$"icons/Laurel-crown".position.y = base_y + y_offset
	$"icons/Fishing-pole".position.y = base_y + y_offset
	$"icons/Shop".position.y = base_y + y_offset
	
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

func change_work_time(minutes: int):
	global.save.work_time_min = minutes
	
func change_rest_time(minutes:int): 
	global.save.rest_time_min = minutes
