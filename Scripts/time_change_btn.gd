extends Button

signal change_time(minutes: int)

func _on_pressed():
	emit_signal("change_time",int(text))
