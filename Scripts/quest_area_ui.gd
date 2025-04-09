extends Control

var questQuest = preload("res://Scenes/quest_quest.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	
func open_quests():
	show()
	for node in $VBoxContainer/ScrollContainer/VBoxContainer.get_children():
		node.queue_free()
	for quest in global.save.completed_quests:
		add_quest(quest)
	for quest in global.save.uncompleted_quests:
		add_quest(quest)
	
func close_quests():
	hide()

func add_quest(quest: Quest):
	var q = questQuest.instantiate()
	q.quest = quest
	$VBoxContainer/ScrollContainer/VBoxContainer.add_child(q)
