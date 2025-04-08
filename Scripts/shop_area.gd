extends Area2D

func _on_area_entered(area):
	print("entered area")
	$shop.open_shop()

func _on_area_exited(area):
	$shop.close_shop()
