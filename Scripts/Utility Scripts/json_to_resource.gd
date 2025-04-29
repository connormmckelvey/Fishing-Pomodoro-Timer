extends Node

# Define multiple fish in an array

var json = {}
var catchables_json = []
var gear_json = []
var quests_json = []

func _ready():
	json = JSON.parse_string(FileAccess.open("res://data.json",FileAccess.READ).get_as_text())
	catchables_json = json["catchables"]
	gear_json = json["gear"]
	quests_json = json["quests"]
	create_gear_resources(gear_json)
	create_catchable_resources(catchables_json)
	create_quest_resources(quests_json)
	global.generate_new_save_from_resources()
	pass
	
func create_catchable_resources(catchables_json: Array):
	for i in range(catchables_json.size()):
		var c_resource = Catchable.new()
		c_resource.catchable_name = catchables_json[i]["name"]
		c_resource.depth = catchables_json[i]["depth"]
		c_resource.rarity = catchables_json[i]["rarity"]
		c_resource.type = catchables_json[i]["type"]
		c_resource.value = int(catchables_json[i]["value"])
		if i < 144:
			c_resource.texture = load("res://Assets/catchables icons/"+str(i+1)+".png")
		else:
			c_resource.texture = load("res://Assets/objects icon/"+str(i - 143)+".png")
		var file_path = "res://Resources/Catchables/" + c_resource.catchable_name.to_lower().strip_edges().replace(" ", "_") + ".tres"
		ResourceSaver.save(c_resource, file_path)
		print("Saved: " + file_path)

func create_gear_resources(gear_json: Array):
	for i in range(gear_json.size()):
		var g_resource = Gear.new()
		g_resource.gear_name = gear_json[i]["name"]
		g_resource.cost = int(gear_json[i]["cost"])
		g_resource.rarity = gear_json[i]["rarity"]
		g_resource.type = gear_json[i]["type"]
		g_resource.bonuses["depth_score"] = int(gear_json[i]["depth bonus"])
		g_resource.bonuses["rariety_score"] = int(gear_json[i]["rarity bonus"])
		g_resource.bonuses["types_avilable"] = gear_json[i]["types"].split(",")
		g_resource.texture = load("res://Assets/gear icons/"+str(i+1)+".png")
		var file_path = "res://Resources/Gear/" + g_resource["gear_name"].to_lower().strip_edges().replace(" ", "_") + ".tres"
		ResourceSaver.save(g_resource, file_path)
		print("Saved: " + file_path)

func create_quest_resources(quest_json: Array):
	for i in range(quest_json.size()):
		var q_resource
#define and set specific quest params
		if quests_json[i]["type"] == "TotalCollectionQuest":
			q_resource = TotalCollectionQuest.new()
			q_resource.needed_amount = quests_json[i]["need amt"]
		elif quests_json[i]["type"] == "NameCollectionQuest":
			q_resource = NameCollectionQuest.new()
			q_resource.needed_amount = quests_json[i]["need amt"]
			q_resource.name = quests_json[i]["catchable name"]
		elif quests_json[i]["type"] == "TypeCollectionQuest":
			q_resource = TypeCollectionQuest.new()
			q_resource.needed_amount = quests_json[i]["need amt"]
			q_resource.type = quests_json[i]["catchable type"]
#set quest params
		q_resource.quest_name = quests_json[i]["Name"]
		q_resource.description = quests_json[i]["description"]
		q_resource.level_unlock = quests_json[i]["level unlock"]
		if quests_json[i].has("money reward"):
			q_resource.money_reward = quests_json[i]["money reward"]
		if quests_json[i].has("gear reward"):
			print("quest adding "+quests_json[i]["gear reward"])
			q_resource.gear_reward = global.get_resource_by_path(global.gear_folder+quests_json[i]["gear reward"].to_lower().strip_edges().replace(" ", "_") + ".tres")
#save new resource
		var file_path = "res://Resources/Quests/" + q_resource["quest_name"].to_lower().strip_edges().replace(" ", "_") + ".tres"
		ResourceSaver.save(q_resource, file_path)
		print("Saved: " + file_path)
