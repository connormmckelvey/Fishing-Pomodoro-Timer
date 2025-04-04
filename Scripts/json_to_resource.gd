extends Node

# Define multiple fish in an array

var catchables_json = [
  {
	"catchable_name": "Progenetica",
	"rarity": 5,
	"depth": 10,
	"type": 0
  },
  {
	"catchable_name": "Clownfish",
	"rarity": 2,
	"depth": 5,
	"type": 0
  },
  {
	"catchable_name": "Blue tang",
	"rarity": 3,
	"depth": 15,
	"type": 0
  },
  {
	"catchable_name": "Yellow tang",
	"rarity": 3,
	"depth": 10,
	"type": 0
  },
  {
	"catchable_name": "Gem tang",
	"rarity": 4,
	"depth": 20,
	"type": 0
  },
  {
	"catchable_name": "Sailfin tang",
	"rarity": 3,
	"depth": 15,
	"type": 0
  },
  {
	"catchable_name": "Angelfish",
	"rarity": 2,
	"depth": 10,
	"type": 0
  },
  {
	"catchable_name": "Queen angelfish",
	"rarity": 4,
	"depth": 25,
	"type": 0
  },
  {
	"catchable_name": "French angelfish",
	"rarity": 3,
	"depth": 20,
	"type": 0
  },
  {
	"catchable_name": "Goldfish",
	"rarity": 1,
	"depth": 2,
	"type": 0
  },
  {
	"catchable_name": "Fighting fish",
	"rarity": 2,
	"depth": 5,
	"type": 0
  },
  {
	"catchable_name": "Catfish",
	"rarity": 3,
	"depth": 10,
	"type": 0
  },
  {
	"catchable_name": "Porcupinefish",
	"rarity": 4,
	"depth": 20,
	"type": 0
  },
  {
	"catchable_name": "Spotted pufferfish",
	"rarity": 3,
	"depth": 15,
	"type": 0
  },
  {
	"catchable_name": "Ocean sunfish",
	"rarity": 5,
	"depth": 30,
	"type": 0
  },
  {
	"catchable_name": "Mahi mahi",
	"rarity": 4,
	"depth": 20,
	"type": 0
  },
  {
	"catchable_name": "Roule’s goby",
	"rarity": 2,
	"depth": 5,
	"type": 0
  },
  {
	"catchable_name": "Red piranha",
	"rarity": 3,
	"depth": 15,
	"type": 0
  },
  {
	"catchable_name": "Lionfish",
	"rarity": 4,
	"depth": 20,
	"type": 0
  },
  {
	"catchable_name": "Red scorpionfish",
	"rarity": 3,
	"depth": 15,
	"type": 0
  },
  {
	"catchable_name": "Stonefish",
	"rarity": 5,
	"depth": 30,
	"type": 0
  },
  {
	"catchable_name": "Flying fish",
	"rarity": 2,
	"depth": 10,
	"type": 0
  },
  {
	"catchable_name": "Guppy",
	"rarity": 1,
	"depth": 2,
	"type": 0
  },
  {
	"catchable_name": "Sailfin molly",
	"rarity": 2,
	"depth": 5,
	"type": 0
  },
  {
	"catchable_name": "Greater weever",
	"rarity": 3,
	"depth": 10,
	"type": 0
  },
  {
	"catchable_name": "Sockeye salmon",
	"rarity": 4,
	"depth": 20,
	"type": 0
  },
  {
	"catchable_name": "Taimen",
	"rarity": 5,
	"depth": 25,
	"type": 0
  },
  {
	"catchable_name": "Atlantic salmon",
	"rarity": 4,
	"depth": 20,
	"type": 0
  },
  {
	"catchable_name": "Masu",
	"rarity": 3,
	"depth": 15,
	"type": 0
  },
  {
	"catchable_name": "European angler",
	"rarity": 5,
	"depth": 30,
	"type": 0
  },
  {
	"catchable_name": "Humpback anglerfish",
	"rarity": 5,
	"depth": 35,
	"type": 0
  },
  {
	"catchable_name": "Hairy frogfish",
	"rarity": 4,
	"depth": 25,
	"type": 0
  }
]

var gear_json = {}

func _ready():
	for i in range(catchables_json.size()):
		var c_resource = Catchable.new()
		c_resource.catchable_name = catchables_json[i]["catchable_name"]
		c_resource.depth = catchables_json[i]["depth"]
		c_resource.rarity = catchables_json[i]["rarity"]
		c_resource.type = catchables_json[i]["type"]
		c_resource.texture = load("res://Assets/catchables icons/"+str(i+1)+".png")
		var file_path = "res://Resources/Catchables/" + c_resource.catchable_name.to_lower().replace(" ", "_") + ".tres"
		ResourceSaver.save(c_resource, file_path)
		print("Saved: " + file_path)

#	for gear in gear_json:
#		var g_resource = Gear.new()
#		g_resource.gear_name = gear["name"]
#		g_resource.cost = gear["cost"]
#		g_resource.rarity = gear["rarity"]
#		g_resource.type = gear["type"]
#		g_resource.bonuses = gear["bonuses"]
#		var file_path = "res://Resources/Gear/" + g_resource["name"].to_lower().replace(" ", "_") + ".tres"
#		ResourceSaver.save(g_resource, file_path)
#		print("Saved: " + file_path)
