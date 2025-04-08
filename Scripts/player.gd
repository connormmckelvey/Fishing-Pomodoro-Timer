extends CharacterBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -200.0
const IDLING = "idle"
const FISHING = "fish"
const WALKING = "walk"
const CATCHING = "hook"

var state = IDLING

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	pass

func _physics_process(delta):
	# Add the gravity.
	if state != FISHING:
		if not is_on_floor():
			velocity.y += gravity * delta

		# Handle jump.
		if Input.is_action_just_pressed("ui_accept") and is_on_floor():
			velocity.y = JUMP_VELOCITY

		# Get the input direction and handle the movement/deceleration.
		# As good practice, you should replace UI actions with custom gameplay actions.
		var direction = Input.get_axis("ui_left", "ui_right")
		if direction:
			if direction < 0:
				$AnimatedSprite2D.flip_h = true
			elif direction > 0:
				$AnimatedSprite2D.flip_h = false
			state = WALKING
			velocity.x = direction * SPEED
		else:
			state = IDLING
			velocity.x = move_toward(velocity.x, 0, SPEED)

	$AnimatedSprite2D.play(state)
	move_and_slide()

func _on_tacklebox_work_started():
	position = Vector2i(932,522)
	state = FISHING
	$AnimatedSprite2D.flip_h = true

func _on_timer_display_done_fishing():
	position = Vector2i(635,432)
	state = IDLING
