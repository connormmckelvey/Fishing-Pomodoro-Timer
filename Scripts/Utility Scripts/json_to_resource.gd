extends Node

# Define multiple fish in an array

var catchables_json = [
  {
	"catchable_name": "Progenetica",
	"rarity": 5,
	"depth": 10,
	"value": 10,
	"type": "fish"
  },
  {
	"catchable_name": "Clownfish",
	"rarity": 2,
	"depth": 5,
	"type": "fish"
  },
  {
	"catchable_name": "Blue tang",
	"rarity": 3,
	"depth": 15,
	"type": "fish"
  },
  {
	"catchable_name": "Yellow tang",
	"rarity": 3,
	"depth": 10,
	"type": "fish"
  },
  {
	"catchable_name": "Gem tang",
	"rarity": 4,
	"depth": 20,
	"type": "fish"
  },
  {
	"catchable_name": "Sailfin tang",
	"rarity": 3,
	"depth": 15,
	"type": "fish"
  },
  {
	"catchable_name": "Angelfish",
	"rarity": 2,
	"depth": 10,
	"type": "fish"
  },
  {
	"catchable_name": "Queen angelfish",
	"rarity": 4,
	"depth": 25,
	"type": "fish"
  },
  {
	"catchable_name": "French angelfish",
	"rarity": 3,
	"depth": 20,
	"type": "fish"
  },
  {
	"catchable_name": "Goldfish",
	"rarity": 1,
	"depth": 2,
	"type": "fish"
  },
  {
	"catchable_name": "Fighting fish",
	"rarity": 2,
	"depth": 5,
	"type": "fish"
  },
  {
	"catchable_name": "Catfish",
	"rarity": 3,
	"depth": 10,
	"type": "fish"
  },
  {
	"catchable_name": "Porcupinefish",
	"rarity": 4,
	"depth": 20,
	"type": "pufferfish"
  },
  {
	"catchable_name": "Spotted pufferfish",
	"rarity": 3,
	"depth": 15,
	"type": "pufferfish"
  },
  {
	"catchable_name": "Ocean sunfish",
	"rarity": 5,
	"depth": 30,
	"type": "fish"
  },
  {
	"catchable_name": "Mahi mahi",
	"rarity": 4,
	"depth": 20,
	"type": "fish"
  },
  {
	"catchable_name": "Roule’s goby",
	"rarity": 2,
	"depth": 5,
	"type": "goby"
  },
  {
	"catchable_name": "Red piranha",
	"rarity": 3,
	"depth": 15,
	"type": "piranha"
  },
  {
	"catchable_name": "Lionfish",
	"rarity": 4,
	"depth": 20,
	"type": "fish"
  },
  {
	"catchable_name": "Red scorpionfish",
	"rarity": 3,
	"depth": 15,
	"type": "scorpionfish"
  },
  {
	"catchable_name": "Stonefish",
	"rarity": 5,
	"depth": 30,
	"type": "scorpionfish"
  },
  {
	"catchable_name": "Flying fish",
	"rarity": 2,
	"depth": 10,
	"type": "fish"
  },
  {
	"catchable_name": "Guppy",
	"rarity": 1,
	"depth": 2,
	"type": "fish"
  },
  {
	"catchable_name": "Sailfin molly",
	"rarity": 2,
	"depth": 5,
	"type": "fish"
  },
  {
	"catchable_name": "Greater weever",
	"rarity": 3,
	"depth": 10,
	"type": "weever"
  },
  {
	"catchable_name": "Sockeye salmon",
	"rarity": 4,
	"depth": 20,
	"type": "salmon"
  },
  {
	"catchable_name": "Taimen",
	"rarity": 5,
	"depth": 25,
	"type": "salmon"
  },
  {
	"catchable_name": "Atlantic salmon",
	"rarity": 4,
	"depth": 20,
	"type": "salmon"
  },
  {
	"catchable_name": "Masu",
	"rarity": 3,
	"depth": 15,
	"type": "salmon"
  },
  {
	"catchable_name": "European angler",
	"rarity": 5,
	"depth": 30,
	"type": "anglerfish"
  },
  {
	"catchable_name": "Humpback anglerfish",
	"rarity": 5,
	"depth": 35,
	"type": "anglerfish"
  },
  {
	"catchable_name": "Hairy frogfish",
	"rarity": 4,
	"depth": 25,
	"type": "frogfish"
  }
];

var gear_json = [
	{
		gear_name = "Wooden fishing rod",
		cost = 10,
		rarity = 1,
		type = "Rod",
		bonuses = {
			"depth_score": 2,
			"rariety_score": 1,
			"types_avilable": ["fish"]
		}
	},
	{
		gear_name = "Bamboo fishing rod",
		cost = 25,
		rarity = 2,
		type = "Rod",
		bonuses = {
			"depth_score": 3,
			"rariety_score": 1,
			"types_avilable": ["fish"]
		}
	},
	{
		gear_name = "Steel fishing rod",
		cost = 50,
		rarity = 3,
		type = "Rod",
		bonuses = {
			"depth_score": 5,
			"rariety_score": 2,
			"types_avilable": ["fish", "pufferfish"]
		}
	},
	{
		gear_name = "Glass fiber fishing rod",
		cost = 75,
		rarity = 3,
		type = "Rod",
		bonuses = {
			"depth_score": 6,
			"rariety_score": 2,
			"types_avilable": ["fish", "anglerfish"]
		}
	},
	{
		gear_name = "Carbon fiber fishing rod",
		cost = 100,
		rarity = 4,
		type = "Rod",
		bonuses = {
			"depth_score": 8,
			"rariety_score": 3,
			"types_avilable": ["fish", "anglerfish", "pufferfish"]
		}
	},
	{
		gear_name = "Fishing line",
		cost = 15,
		rarity = 1,
		type = "Tackle",
		bonuses = {
			"depth_score": 1,
			"rariety_score": 0,
			"types_avilable": ["fish"]
		}
	},
	{
		gear_name = "Fishing hook",
		cost = 10,
		rarity = 1,
		type = "Tackle",
		bonuses = {
			"depth_score": 0,
			"rariety_score": 1,
			"types_avilable": ["fish"]
		}
	},
	{
		gear_name = "Jig lure",
		cost = 20,
		rarity = 2,
		type = "Tackle",
		bonuses = {
			"depth_score": 2,
			"rariety_score": 1,
			"types_avilable": ["fish", "scorpionfish"]
		}
	},
	{
		gear_name = "Fly lure",
		cost = 15,
		rarity = 2,
		type = "Tackle",
		bonuses = {
			"depth_score": 1,
			"rariety_score": 2,
			"types_avilable": ["fish", "salmon"]
		}
	},
	{
		gear_name = "Crankbait",
		cost = 30,
		rarity = 3,
		type = "Tackle",
		bonuses = {
			"depth_score": 3,
			"rariety_score": 2,
			"types_avilable": ["fish", "pufferfish"]
		}
	},
	{
		gear_name = "Spinner lure",
		cost = 25,
		rarity = 2,
		type = "Tackle",
		bonuses = {
			"depth_score": 2,
			"rariety_score": 1,
			"types_avilable": ["fish"]
		}
	},
	{
		gear_name = "Fishing magnet",
		cost = 40,
		rarity = 3,
		type = "Accessory",
		bonuses = {
			"depth_score": 4,
			"rariety_score": 0,
			"types_avilable": ["trash"]
		}
	},
	{
		gear_name = "Fishing lead / Sinker",
		cost = 20,
		rarity = 2,
		type = "Tackle",
		bonuses = {
			"depth_score": 3,
			"rariety_score": 0,
			"types_avilable": ["fish", "deepfish"]
		}
	},
	{
		gear_name = "Meat bait",
		cost = 10,
		rarity = 1,
		type = "Tackle",
		bonuses = {
			"depth_score": 0,
			"rariety_score": 1,
			"types_avilable": ["crab", "scorpionfish"]
		}
	},
	{
		gear_name = "Worm bait",
		cost = 5,
		rarity = 1,
		type = "Tackle",
		bonuses = {
			"depth_score": 0,
			"rariety_score": 1,
			"types_avilable": ["fish"]
		}
	},
	{
		gear_name = "Fruit bait",
		cost = 5,
		rarity = 1,
		type = "Tackle",
		bonuses = {
			"depth_score": 0,
			"rariety_score": 2,
			"types_avilable": ["fish"]
		}
	},
	{
		gear_name = "Garlic bait",
		cost = 5,
		rarity = 2,
		type = "Tackle",
		bonuses = {
			"depth_score": 0,
			"rariety_score": 2,
			"types_avilable": ["piranha"]
		}
	},
	{
		gear_name = "Seafood bait",
		cost = 15,
		rarity = 3,
		type = "Tackle",
		bonuses = {
			"depth_score": 0,
			"rariety_score": 3,
			"types_avilable": ["crab", "anglerfish"]
		}
	},
	{
		gear_name = "Bait catapult / Bait slingshot",
		cost = 30,
		rarity = 2,
		type = "Accessory",
		bonuses = {
			"depth_score": 1,
			"rariety_score": 2,
			"types_avilable": ["fish"]
		}
	},
	{
		gear_name = "Cork bobber",
		cost = 5,
		rarity = 1,
		type = "Tackle",
		bonuses = {
			"depth_score": 0,
			"rariety_score": 1,
			"types_avilable": ["fish"]
		}
	},
	{
		gear_name = "Plastic bobber",
		cost = 10,
		rarity = 1,
		type = "Tackle",
		bonuses = {
			"depth_score": 1,
			"rariety_score": 1,
			"types_avilable": ["fish"]
		}
	},
	{
		gear_name = "Fish weight machine",
		cost = 35,
		rarity = 3,
		type = "Accessory",
		bonuses = {
			"depth_score": 0,
			"rariety_score": 3,
			"types_avilable": ["fish"]
		}
	},
	{
		gear_name = "Fishing net",
		cost = 20,
		rarity = 2,
		type = "Tackle",
		bonuses = {
			"depth_score": 1,
			"rariety_score": 1,
			"types_avilable": ["fish", "trash"]
		}
	},
	{
		gear_name = "Fish trap",
		cost = 25,
		rarity = 2,
		type = "Tackle",
		bonuses = {
			"depth_score": 1,
			"rariety_score": 2,
			"types_avilable": ["fish"]
		}
	},
	{
		gear_name = "Crab trap",
		cost = 30,
		rarity = 3,
		type = "Tackle",
		bonuses = {
			"depth_score": 1,
			"rariety_score": 2,
			"types_avilable": ["crab"]
		}
	},
	{
		gear_name = "Harpoon gun / Spear gun",
		cost = 50,
		rarity = 4,
		type = "Rod",
		bonuses = {
			"depth_score": 5,
			"rariety_score": 3,
			"types_avilable": ["fish", "anglerfish", "pufferfish"]
		}
	},
	{
		gear_name = "Harpoon",
		cost = 30,
		rarity = 3,
		type = "Rod",
		bonuses = {
			"depth_score": 4,
			"rariety_score": 2,
			"types_avilable": ["fish", "deepfish"]
		}
	},
	{
		gear_name = "Fork harpoon",
		cost = 35,
		rarity = 3,
		type = "Rod",
		bonuses = {
			"depth_score": 4,
			"rariety_score": 2,
			"types_avilable": ["fish", "anglerfish"]
		}
	},
	{
		gear_name = "Fishing spear",
		cost = 20,
		rarity = 2,
		type = "Rod",
		bonuses = {
			"depth_score": 3,
			"rariety_score": 1,
			"types_avilable": ["fish"]
		}
	},
	{
		gear_name = "Trident",
		cost = 45,
		rarity = 4,
		type = "Rod",
		bonuses = {
			"depth_score": 5,
			"rariety_score": 2,
			"types_avilable": ["fish", "anglerfish"]
		}
	},
	{
		gear_name = "Bucket",
		cost = 5,
		rarity = 1,
		type = "Accessory",
		bonuses = {
			"depth_score": 0,
			"rariety_score": 0,
			"types_avilable": ["fish"]
		}
	},
	{
		gear_name = "Fishing bag",
		cost = 10,
		rarity = 1,
		type = "Accessory",
		bonuses = {
			"depth_score": 0,
			"rariety_score": 1,
			"types_avilable": ["fish"]
		}
	},
	{
		gear_name = "Portable fridge",
		cost = 50,
		rarity = 3,
		type = "Accessory",
		bonuses = {
			"depth_score": 0,
			"rariety_score": 3,
			"types_avilable": ["fish"]
		}
	},
	{
		gear_name = "Tackle box",
		cost = 25,
		rarity = 2,
		type = "Accessory",
		bonuses = {
			"depth_score": 0,
			"rariety_score": 2,
			"types_avilable": ["fish"]
		}
	},
	{
		gear_name = "Fishing marker",
		cost = 15,
		rarity = 1,
		type = "Accessory",
		bonuses = {
			"depth_score": 0,
			"rariety_score": 1,
			"types_avilable": ["fish"]
		}
	},
	{
		gear_name = "Fishing sonar",
		cost = 60,
		rarity = 4,
		type = "Accessory",
		bonuses = {
			"depth_score": 6,
			"rariety_score": 3,
			"types_avilable": ["fish", "deepfish", "anglerfish"]
		}
	}
]

func _ready():
	#for i in range(catchables_json.size()):
		#var c_resource = Catchable.new()
		#c_resource.catchable_name = catchables_json[i]["catchable_name"]
		#c_resource.depth = catchables_json[i]["depth"]
		#c_resource.rarity = catchables_json[i]["rarity"]
		#c_resource.type = catchables_json[i]["type"]
		#c_resource.texture = load("res://Assets/catchables icons/"+str(i+1)+".png")
		#var file_path = "res://Resources/Catchables/" + c_resource.catchable_name.to_lower().replace(" ", "_") + ".tres"
		#ResourceSaver.save(c_resource, file_path)
		#print("Saved: " + file_path)

	for i in range(gear_json.size()):
		var g_resource = Gear.new()
		g_resource.gear_name = gear_json[i]["gear_name"]
		g_resource.cost = gear_json[i]["cost"]
		g_resource.rarity = gear_json[i]["rarity"]
		g_resource.type = gear_json[i]["type"]
		g_resource.bonuses = gear_json[i]["bonuses"]
		g_resource.texture = load("res://Assets/gear icons/"+str(i+1)+".png")
		var file_path = "res://Resources/Gear/" + g_resource["gear_name"].to_lower().replace(" ", "_") + ".tres"
		ResourceSaver.save(g_resource, file_path)
		print("Saved: " + file_path)
