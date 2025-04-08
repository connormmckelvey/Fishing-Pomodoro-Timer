extends Control

var shopGear = preload("res://Scenes/shop_gear.tscn")
var shopCatchable = preload("res://Scenes/shop_catchable.tscn")

func _ready():
	for gear in global.save.gear_not_owned:
		add_gear(gear)
	hide()
	
func open_shop():
	show()
	for node in $VBoxContainer/HBoxContainer/ScrollContainer2/sell_grid.get_children():
		node.queue_free()
	for catchable in global.save.catches:
		add_catchable(catchable)
	
func close_shop():
	hide()
		
func add_gear(gear):
	var sg = shopGear.instantiate()
	sg.gear = gear
	$VBoxContainer/HBoxContainer/ScrollContainer/buy_grid.add_child(sg)
	
func add_catchable(catchable):
	var sc = shopCatchable.instantiate()
	sc.catchable = catchable
	$VBoxContainer/HBoxContainer/ScrollContainer2/sell_grid.add_child(sc)
 
