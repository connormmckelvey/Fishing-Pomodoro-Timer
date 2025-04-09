extends Quest
class_name TotalCollectionQuest

@export var needed_amount:int
var amount = 0

func check_quest_progress():
	amount += global.save.catches.size()
	if amount >= needed_amount:
		return true
	return false
	
func display_quest_progress():
	return str(amount)+"/"+str(needed_amount)
