extends Node

#change to "user://save.tres" in export
const SAVE_PATH = "res://Resources/save.tres"

@export var gear_folder: String = "res://Resources/Gear/"
@export var catchable_folder: String = "res://Resources/Catchables/"
@export var quest_folder: String = "res://Resources/Quests/"

@export var save: SaveData

func _enter_tree():
	save = load("res://Resources/save.tres") as SaveData
	#if ResourceLoader.exists(SAVE_PATH):
		#save = load(SAVE_PATH) as SaveData
	#else:
		#save = load("res://Resources/save.tres")

func save_to_resource(savedata: SaveData):
	ResourceSaver.save(savedata,SAVE_PATH)
	print("saved!")

func _exit_tree():
	#save_to_resource(save)
	pass

func add_gear_to_save():
	save.gear_not_owned.clear()
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
				print("added "+save.gear_not_owned[-1].gear_name)
		file = dir.get_next()
	dir.list_dir_end()

func add_catchables_to_save():
	save.catchables.clear()
	var dir = DirAccess.open(catchable_folder)
	if not dir:
		push_error("Couldn't open folder: " + catchable_folder)
		return

	dir.list_dir_begin()
	var file = dir.get_next()
	while file != "":
		if not dir.current_is_dir() and (file.ends_with(".tres") or file.ends_with(".res")):
			var path = catchable_folder + file
			var res = load(path)
			if res and res is Catchable:
				save.catchables.append(res)
				print("added"+str(res))
		file = dir.get_next()
	dir.list_dir_end()

func add_quests_to_save():
	save.uncompleted_quests.clear()
	var dir = DirAccess.open(quest_folder)
	if not dir:
		push_error("Couldn't open folder: " + quest_folder)
		return

	dir.list_dir_begin()
	var file = dir.get_next()
	while file != "":
		if not dir.current_is_dir() and (file.ends_with(".tres") or file.ends_with(".res")):
			var path = quest_folder + file
			var res = load(path)
			if res and res is Quest:
				save.uncompleted_quests.append(res)
				print("added"+str(res))
		file = dir.get_next()
	dir.list_dir_end()

func get_resource_by_path(target_path: String) -> Resource:
		var full_path = target_path
		return load(full_path)


func generate_new_save_from_resources():
	add_catchables_to_save()
	add_gear_to_save()
	add_quests_to_save()
	save_to_resource(save)
