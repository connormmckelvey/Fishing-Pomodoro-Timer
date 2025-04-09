extends Quest
class_name TypeCollectionQuest

@export var amount: int
@export var type: String

func check_quest_progress():
	for catch in global.save.catches:
		if catch.type == type:
			amount -= 1
	if amount <= 0:
		return true
	return false
