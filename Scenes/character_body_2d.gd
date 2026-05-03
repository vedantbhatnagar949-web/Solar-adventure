extends CharacterBody2D

class_name Player

var dead = false
const SPEED = 100.0
const JUMP_VELOCITY = -280.0
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var enemy: Node2D = $enemy
var is_dead = false


func _physics_process(delta: float) -> void:
	if is_dead:
		return # Stop processing movement if dead

	# ... your existing movement code ...

	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("Move_left","Move_right" )
	if is_on_floor():
		if direction == 0:
			animated_sprite_2d.play("default")
		else:
			animated_sprite_2d.play("run")
	else:
		animated_sprite_2d.play("jump")
# changes face

	if direction > 0:
		animated_sprite_2d.flip_h = false
	elif direction < 0:
		animated_sprite_2d.flip_h = true
	
	
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	


	
# ... existing variables like speed and gravity ...



	
func die():
	is_dead = true
	animated_sprite_2d.play("die") # Play the death animation
	# Optional: disable collision so the player falls through the floor [01:08:52]
	collision_layer = 0	
	

		
	
