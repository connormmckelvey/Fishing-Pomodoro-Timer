extends Label

@export var quest: Quest

# Called when the node enters the scene tree for the first time.
func _ready():
	$HBoxContainer/VBoxContainer/quest_name.text = quest.quest_name
	$HBoxContainer/VBoxContainer/quest_description.text = quest.description
	$HBoxContainer/VBoxContainer2/progress.text = quest.display_quest_progress()
	$HBoxContainer/VBoxContainer2/money_reward.text = "Cash Reward:"+str(quest.money_reward)
	if quest.gear_reward:
		$HBoxContainer/VBoxContainer2/gear_reward.text = str(quest.gear_reward.gear_name)
	else:
		$HBoxContainer/VBoxContainer2/gear_reward.hide()
	if quest in global.save.completed_quests:
		$Button.show()

func _on_button_pressed():
	quest.give_rewards()
	global.save.completed_quests.erase(quest)
	global.save.claimed_quests.append(quest)
	queue_free()
