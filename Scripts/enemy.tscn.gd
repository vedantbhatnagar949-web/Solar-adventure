extends Node2D

const SPEED = 60

var direction = 1

@onready var ray_castright: RayCast2D = $RayCastright
@onready var ray_castleft: RayCast2D = $RayCastleft



func _process(delta):
	if ray_castright.is_colliding():
		direction = -1

	if ray_castleft.is_colliding():
		direction = 1

	position.x += direction * SPEED * delta
