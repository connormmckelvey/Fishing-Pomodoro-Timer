extends Button

@export var catchable: Catchable

signal sell_catchable(catchable: Catchable)

func _ready():
	var original_texture = catchable.texture
	var image = original_texture.get_image()
	image.resize(128, 128, Image.INTERPOLATE_NEAREST)
	var scaled_texture = ImageTexture.create_from_image(image)
	icon = scaled_texture

	var style = get_theme_stylebox("normal") as StyleBoxFlat
	style.border_color = Color(10 + (catchable.rarity * 10),0,0)

	$ColorRect/VBoxContainer/name.text = catchable.catchable_name
	$ColorRect/VBoxContainer/rarity.text = "Rarity: "+ stars_string(catchable.rarity)
	$ColorRect/VBoxContainer/cost.text = "Sell For: "+str(catchable.value)
	$ColorRect/VBoxContainer/type.text = "Type: "+str(catchable.type)

func _process(delta):
	if $ColorRect.get_rect().has_point(get_local_mouse_position()):
		$ColorRect.show()
	else:
		$ColorRect.hide()

func _on_pressed():
	sell_catchable.emit(catchable)
	global.save.money += catchable.value
	global.save.catches.erase(catchable)
	queue_free()

func stars_string(amt: int):
	var s = ""
	for i in amt:
		s += "★"
	return s
