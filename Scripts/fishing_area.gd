extends Area2D

func _on_area_entered(area):
	$fishing_area.open_tacklebox()

func _on_area_exited(area):
	$fishing_area.close_tacklebox()
