extends Quest
class_name TotalCollectionQuest

@export var amount: int

func check_quest_progress():
	amount -= global.save.catches.size()
	if amount <= 0:
		return true
	return false
	
