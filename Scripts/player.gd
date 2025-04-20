extends CharacterBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -200.0
const IDLING = "idle"
const FISHING = "fish"
const WALKING = "walk"
const CATCHIN54G = "hook"

var state = IDLING

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	pass
	#_on_timer_display_done_fishing()

func _physics_process(delta):
	# Add the gravity.
	if state != FISHING:
		if not is_on_floor():
			velocity.y += gravity * delta

		# Handle jump.
		if Input.is_action_just_pressed("up") and is_on_floor():
			velocity.y = JUMP_VELOCITY

		# Get the input direction and handle the movement/deceleration.
		# As good practice, you should replace UI actions with custom gameplay actions.
		var direction = Input.get_axis("left", "right")
		if direction:
			if direction < 0:
				$AnimatedSprite2D.flip_h = true
			elif direction > 0:
				$AnimatedSprite2D.flip_h = false
			change_state(WALKING)
			velocity.x = direction * SPEED
		else:
			change_state(IDLING)
			velocity.x = move_toward(velocity.x, 0, SPEED)

	$AnimatedSprite2D.play(state)
	move_and_slide()

func _on_tacklebox_work_started():
	position = Vector2i(932,522)
	change_state(FISHING)
	$AnimatedSprite2D.flip_h = true

func _on_timer_display_done_fishing():
	var total_rarity_score = global.save.equiped_tackle.bonuses["rariety_score"] + global.save.equiped_rod.bonuses["rariety_score"] + global.save.equiped_accessory.bonuses["rariety_score"]
	var total_depth_score = global.save.equiped_tackle.bonuses["depth_score"] + global.save.equiped_rod.bonuses["depth_score"] + global.save.equiped_accessory.bonuses["depth_score"] 
	
	calculate_catch_2(global.save.level,total_rarity_score,total_depth_score,global.save.work_time_min + 10,get_valid_catchables())
	calculate_levelup()
	for quest in global.save.uncompleted_quests:
		if quest.check_quest_progress() == true:
			global.save.completed_quests.append(quest)
			global.save.uncompleted_quests.erase(quest)

	position = Vector2i(635,432)
	state = IDLING

func calculate_levelup():
	global.save.xp += global.save.work_time_min
	print(global.save.xp)
	if global.save.xp >= (global.save.level + 1) * 100:
		global.save.level += 1
		audio_manager.play_sound(load("res://Assets/Audio/level-up-4-243762.mp3"))

func calculate_catch(num_catches:int):
	var total_rarity_score = global.save.equiped_tackle.bonuses["rariety_score"] + global.save.equiped_rod.bonuses["rariety_score"] + global.save.equiped_accessory.bonuses["rariety_score"]
	var total_depth_score = global.save.equiped_tackle.bonuses["depth_score"] + global.save.equiped_rod.bonuses["depth_score"] + global.save.equiped_accessory.bonuses["depth_score"] 
	var all_types_aviable = []
	for type in global.save.equiped_tackle.bonuses["types_avilable"]:
		all_types_aviable.append(type)
	for type in global.save.equiped_rod.bonuses["types_avilable"]:
		all_types_aviable.append(type)
	for type in global.save.equiped_accessory.bonuses["types_avilable"]:
		all_types_aviable.append(type)
	all_types_aviable.sort()

	var valid_catchables = get_valid_catchables()
	if valid_catchables.is_empty():
		return
	# Weight: common (rarity 1) = high chance, rare (rarity 5+) = low chance
	var weights = valid_catchables.map(func(c): return 1.0 / float(c.rarity))
	for i in num_catches:
		var index = weighted_random_index(weights)
		global.save.catches.append(valid_catchables[index])  # Duplicates allowed

#calculates catch for a third of min in duration, based on finding fish that are close to rarity and depth equiped
func calculate_catch_2(level: int, rarity_score: int, depth_score: int, duration: int, fish_list: Array):
	var caught_fish := []
	for i in int(duration*3):
		var shuffled_fish = fish_list
		shuffled_fish.shuffle()

		for fish in shuffled_fish:
			var fish_rarity = fish.rarity
			var fish_depth = fish.depth

			# Rarity logic
			var rarity_diff = abs(fish_rarity - rarity_score)
			var rarity_chance = max(1, 25 - rarity_diff - int(level / 2))

			# Depth logic
			var depth_diff = abs(fish_depth - depth_score)
			var depth_modifier = max(1, 20 - int(depth_diff / 50))

			# Final catch chance
			var catch_chance = rarity_chance + depth_modifier + level

			if randi() % 100 + 1 <= catch_chance:
				caught_fish.append(fish)
				print(fish.catchable_name + "caught")
				break  # Only one fish per tick
			else:
				print(fish.catchable_name)

	print(caught_fish)
	for catch in caught_fish:
		global.save.catches.append(catch)

#returns all catchables that have a type that can be caught
func get_valid_catchables() -> Array:
	var all_types_aviable = []
	var filtered = []
	for type in global.save.equiped_tackle.bonuses["types_avilable"]:
		all_types_aviable.append(type)
	for type in global.save.equiped_rod.bonuses["types_avilable"]:
		all_types_aviable.append(type)
	for type in global.save.equiped_accessory.bonuses["types_avilable"]:
		all_types_aviable.append(type)
	all_types_aviable.sort()
	
	for catchable in global.save.catchables:
		if catchable.type in all_types_aviable:
			filtered.append(catchable)
	return filtered

func weighted_random_index(weights: Array) -> int:
	var total = weights.reduce(func(a, b): return a + b, 0.0)
	var r = randf() * total
	var accum = 0.0
	for i in weights.size():
		accum += weights[i]
		if r < accum:
			return i
	return weights.size() - 1

func change_state(new_state: String):
	var path = "res://Assets/Audio/"+new_state+".mp3"
	if state != new_state:
		$state_player.stop()
	if ResourceLoader.exists(path) and state != new_state:
		print("playing "+new_state)
		$state_player.stream = load("res://Assets/Audio/"+new_state+".mp3")
		$state_player.play()
	state = new_state
