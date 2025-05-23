extends Resource
class_name Quest

@export var quest_name: String
@export var description: String
@export var level_unlock: int
@export var money_reward: int
@export var gear_reward: Gear

#to be overidden in child class to check quest progress
func check_quest_progress():
	return false

func display_quest_progress():
	return "none"

func give_rewards():
	global.save.money += money_reward
	if gear_reward:
		global.save.gear_owned.append(gear_reward)
