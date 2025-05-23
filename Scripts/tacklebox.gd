extends Control

var tackleBoxGear = preload("res://Scenes/tackle_box_gear.tscn")

signal work_started

func _ready():
	hide()

func open_tacklebox():
	show()
	audio_manager.play_sound(load("res://Assets/Audio/ui-click-43196.mp3"))
	for node in $VBoxContainer/HBoxContainer/ScrollContainer/GridContainer.get_children():
		node.queue_free()
	for gear in global.save.gear_owned:
		add_gear(gear)
	display_equiped()
	
func close_tacklebox():
	hide()
	audio_manager.play_sound(load("res://Assets/Audio/ui-click-43196.mp3"))
		
func add_gear(gear):
	var tbg = tackleBoxGear.instantiate()
	tbg.gear = gear
	tbg.connect("equiped_gear",equip_gear)
	$VBoxContainer/HBoxContainer/ScrollContainer/GridContainer.add_child(tbg)
	
func add_active_gear(gear):
	var tbg = tackleBoxGear.instantiate()
	tbg.gear = gear
	$VBoxContainer/HBoxContainer/VBoxContainer.add_child(tbg)
 
func equip_gear(gear: Gear):
	if gear.type == "tackle":
		global.save.equiped_tackle = gear
	elif gear.type == "rod":
		global.save.equiped_rod = gear
	else:
		global.save.equiped_accessory = gear
	display_equiped()
	
func display_equiped():
	for node in $VBoxContainer/HBoxContainer/VBoxContainer.get_children():
		node.queue_free()
	add_active_gear(global.save.equiped_tackle)
	add_active_gear(global.save.equiped_rod)
	add_active_gear(global.save.equiped_accessory)

func _on_go_fishing_btn_pressed():
	work_started.emit()
	close_tacklebox()
