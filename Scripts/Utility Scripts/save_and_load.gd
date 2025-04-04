extends Node

const SAVE_PATH = "res://Resources/save.tres"

func load_to_resource():
	if ResourceLoader.exists(SAVE_PATH):
		return load(SAVE_PATH)
	return null

func save_to_resource(savedata: SaveData):
	ResourceSaver.save(savedata,SAVE_PATH)
