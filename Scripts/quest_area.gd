extends Area2D

func _on_area_entered(area):
	print("entered area")
	$quest_area.open_quests()

func _on_area_exited(area):
	$quest_area.open_quests()
