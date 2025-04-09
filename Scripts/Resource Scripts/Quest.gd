extends Resource
class_name Quest

@export var quest_name: String
@export var description: String
@export var level_unlock: int

#to be overidden in child class to check quest progress
func check_quest_progress():
	return false
