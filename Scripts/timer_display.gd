extends Label

var isworking = false

# Called when the node enters the scene tree for the first time.
func _ready():
	text = str(global.save.work_time_min)

func _on_tacklebox_work_started():
	isworking = true
	$Timer.wait_time = global.save.work_time_min * 60
	$Timer.start()
	
func _process(delta):
	text = format_seconds($Timer.time_left)

func format_seconds(seconds: int) -> String:
	var minutes = seconds / 60
	var secs = seconds % 60
	return "%02d:%02d" % [minutes, secs]

func _on_timer_timeout():
	if isworking:
		isworking = false
		$Timer.wait_time = global.save.rest_time_min * 60
		$timer.start()
