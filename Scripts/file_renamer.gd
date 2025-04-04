extends Node

# Replace with your actual folder path (relative to the project root)
const IMAGE_FOLDER := "res://Assets/gear icons/"
const GRID_ROWS := 12
const GRID_COLS := 12
var fish_names = [
	"Progenetica",
	"Clownfish",
	"Blue tang",
	"Yellow tang",
	"Gem tang",
	"Sailfin tang",
	"Angelfish",
	"Queen angelfish",
	"French angelfish",
	"Goldfish",
	"Fighting fish",
	"Catfish",
	"Porcupinefish",
	"Spotted pufferfish",
	"Ocean sunfish",
	"Mahi mahi",
	"Roule’s goby",
	"Red piranha",
	"Lionfish",
	"Red scorpionfish",
	"Stonefish",
	"Flying fish",
	"Guppy",
	"Sailfin molly",
	"Greater weever",
	"Sockeye salmon",
	"Taimen",
	"Atlantic salmon",
	"Masu",
	"European angler",
	"Humpback anglerfish",
	"Hairy frogfish",
	"Common carp",
	"Tench",
	"Koi carp",
	"Barracuda",
	"Cardinal tetra",
	"Emperor tetra",
	"Zebrafish",
	"Petticoat tetra",
	"Perch",
	"Starry sturgeon",
	"Lake sturgeon",
	"Striped marlin",
	"Swordfish",
	"Garfish",
	"European pilchard",
	"Atlantic herring",
	"Blackspot seabream",
	"Silver seabream",
	"Atlantic cod",
	"Hake",
	"Bluefin tuna",
	"Pike",
	"Common barbel",
	"Tiger barb",
	"Cherry barb",
	"Opah",
	"Blue discus",
	"Rainbow trout",
	"Ribbon eel",
	"Giant moray eel",
	"European conger",
	"Harlequin snake eel",
	"Oarfish",
	"African coelacanth",
	"Longnose gar",
	"Saddled bichir",
	"Senegal bichir",
	"Turbot",
	"European seabass",
	"European anchovy",
	"Humphead wrasse",
	"Common stingray",
	"Shortfin mako shark",
	"River lamprey",
	"Racoon butterfish",
	"Atlantic trumpetfish",
	"Bartlett’s anthias",
	"Fire goby",
	"Atlantic spadefish",
	"Blue acara",
	"Oscar",
	"Dwarf Gourami",
	"Clown loach",
	"Arapaima",
	"Asian arowana",
	"Moorish idol",
	"Banggai cardinalfish",
	"Longhorn cowfish",
	"Hogfish",
	"Bluehead wrasse",
	"Lumpfish",
	"Boeseman’s rainbowfish",
	"Hillstream loach",
	"Seahorse",
	"Pacific oyster",
	"Pearl oyster",
	"Hard clam",
	"Giant clam",
	"Mediterranean mussel",
	"Great scallop",
	"Spiny cockle",
	"Mediterranean jellyfish",
	"Nomad jellyfish",
	"Portuguese man o’ war",
	"Common jellyfish",
	"Flame jellyfish",
	"Common octopus",
	"Flapjack octopus",
	"Atlantic giant squid",
	"Common squid",
	"Cushion star",
	"Common starfish",
	"Sea sponge",
	"Sea urchin",
	"Red king crab",
	"Common hermit crab",
	"Blue crab",
	"Yeti crab",
	"Atlantic horseshoe crab",
	"Atlantic crayfish",
	"Common lobster",
	"Spiny lobster",
	"Shrimp",
	"Green sea turtle",
	"Axolotl",
	"Chambered nautilus",
	"Goose barnacle",
	"Blue sea dragon",
	"Sea butterfly",
	"Giant cuttlefish",
	"Sea cucumber",
	"Common sea slug",
	"Emerald sea slug",
	"Leaf slug",
	"Sea bunny",
	"Giant isopod",
	"Queen conch",
	"Purple cone snail",
	"Fireworm",
	"Spoon worm",
	"Planaria",
	"Medicinal leech"
]

func _ready():
	var folder_path = IMAGE_FOLDER
	var dir = DirAccess.open(folder_path)
	if dir == null:
		print("Failed to open directory.")
		return

	var regex = RegEx.new()
	regex.compile("row-(\\d+)-column-(\\d+)\\.png")

	var files_by_grid = []

	# Get all files and store them by (row, col), skipping .import files
	for file_name in dir.get_files():
		# Skip files that are not .png or are .import files
		if !file_name.ends_with(".png") or file_name.ends_with(".import"):
			continue
		
		var match = regex.search(file_name)
		if match != null:
			var row = int(match.get_string(1))
			var col = int(match.get_string(2))
			files_by_grid.append({
				"row": row,
				"col": col,
				"name": file_name
			})

	# Sort by row, then column
	files_by_grid.sort_custom(func(a, b):
		if a.row == b.row:
			return a.col < b.col
		return a.row < b.row
	)

	# Rename each file to flat index (starting at 1)
	for i in range(files_by_grid.size()):
		var new_name = str(i + 1) + ".png"
		var old_path = folder_path + files_by_grid[i].name
		var new_path = folder_path + new_name
		DirAccess.rename_absolute(old_path, new_path)
		print("Renamed %s -> %s" % [files_by_grid[i].name, new_name])
