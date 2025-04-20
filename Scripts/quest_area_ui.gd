extends Control

var questQuest = preload("res://Scenes/quest_quest.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	hide()
	
func open_quests():
	show()
	audio_manager.play_sound(load("res://Assets/Audio/ui-click-43196.mp3"))
	for node in $VBoxContainer/ScrollContainer/VBoxContainer.get_children():
		node.queue_free()
	for quest in global.save.completed_quests:
		add_quest(quest)
	for quest in global.save.uncompleted_quests:
		add_quest(quest)
	
func close_quests():
	hide()
	audio_manager.play_sound(load("res://Assets/Audio/ui-click-43196.mp3"))
	
func add_quest(quest: Quest):
	var q = questQuest.instantiate()
	q.quest = quest
	$VBoxContainer/ScrollContainer/VBoxContainer.add_child(q)
