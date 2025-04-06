extends Resource
class_name SaveData

@export var level: int
@export var equiped_gear: Array[Gear]
@export var gear_owned: Array[Gear] 
@export var gear_not_owned: Array[Gear]
@export var money: int 
@export var catches: Array[Catchable] #current inventory of catchables
@export var work_time_min: int
@export var rest_time_min: int
