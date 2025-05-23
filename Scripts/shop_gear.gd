extends Button

@export var gear: Gear

signal buy_gear(gear: Gear)

const ACCESSORY_COLOR = Color("8ec07c")
const ROD_COLOR = Color("83a598")
const TACKLE_COLOR = Color("d3869b")

func _ready():
	var original_texture = gear.texture
	var image = original_texture.get_image()
	image.resize(128, 128, Image.INTERPOLATE_NEAREST)
	var scaled_texture = ImageTexture.create_from_image(image)
	icon = scaled_texture

	var style = get_theme_stylebox("normal") as StyleBoxFlat
	match gear.type:
		"Accessory":
			style.border_color = ACCESSORY_COLOR
		"Rod":
			style.border_color = ROD_COLOR
		"Tackle":
			style.border_color = TACKLE_COLOR

	$ColorRect/VBoxContainer/name.text = gear.gear_name
	$ColorRect/VBoxContainer/cost.text = "Cost: "+str(gear.cost)
	$ColorRect/VBoxContainer/rarity.text = "Rarity: "+ str(gear.rarity)

func _process(delta):
	if $ColorRect.get_rect().has_point(get_local_mouse_position()):
		$ColorRect.show()
	else:
		$ColorRect.hide()

func _on_pressed():
	buy_gear.emit(gear)
	if global.save.money >= gear.cost:
		global.save.money -= gear.cost
		global.save.gear_owned.append(gear)
		queue_free()

func stars_string(amt: int):
	var s = ""
	for i in amt:
		s += "★"
	return s
	
