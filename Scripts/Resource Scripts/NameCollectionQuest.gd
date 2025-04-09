extends Quest
class_name NameCollectionQuest

@export var needed_amount: int
@export var name: String
var amount = 0

func check_quest_progress():
	for catch in global.save.catches:
		if catch.catchable_name == name:
			amount += 1
	if amount >= needed_amount:
		return true
	return false
	
func display_quest_progress():
	return str(amount)+"/"+str(needed_amount)
