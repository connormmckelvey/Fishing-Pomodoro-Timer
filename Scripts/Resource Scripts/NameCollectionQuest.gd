extends Quest
class_name NameCollectionQuest

@export var amount: int
@export var name: String

func check_quest_progress():
	for catch in global.save.catches:
		if catch.catchable_name == name:
			amount -= 1
	if amount <= 0:
		return true
	return false
