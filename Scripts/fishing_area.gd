extends Area2D

func _on_area_entered(area):
	print("entered area")
	$tacklebox.open_tacklebox()

func _on_area_exited(area):
	$tacklebox.close_tacklebox()
