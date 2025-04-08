extends Node

const SAVE_PATH = "res://Resources/save.tres"

@export var gear_folder: String = "res://Resources/Gear/"

@export var save := load(SAVE_PATH) as SaveData

func save_to_resource(savedata: SaveData):
	ResourceSaver.save(savedata,SAVE_PATH)

func _exit_tree():
	pass
	#save_to_resource(save)


func add_gear_to_save():
	var dir = DirAccess.open(gear_folder)
	if not dir:
		push_error("Couldn't open folder: " + gear_folder)
		return

	dir.list_dir_begin()
	var file = dir.get_next()
	while file != "":
		if not dir.current_is_dir() and (file.ends_with(".tres") or file.ends_with(".res")):
			var path = gear_folder + file
			var res = load(path)
			if res and res is Gear:
				save.gear_not_owned.append(res)
		file = dir.get_next()
	dir.list_dir_end()

