extends Resource
class_name Gear

@export var gear_name: String #name of gear
@export var cost: int #cost of gear
@export var rarity: int
@export var type: String #can only be "Accessory", "Tackle", "Rod"
@export var bonuses: Dictionary #will have key "depth_score", "rariety_score", "types_avilable"
@export var texture: Texture2D
