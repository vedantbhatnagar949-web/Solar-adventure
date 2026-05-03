extends Area2D

@onready var timer = $Timer

func _on_body_entered(body):
	print("You died!")
	Engine.time_scale = 0.5
	 # Slow motion effect 
	
	# Check if the body that entered is the player
	# and if it has a 'die' method (we will add this next)
	if body.has_method("die"):
		body.die()
	
	timer.start()

func _on_timer_timeout():
	Engine.time_scale = 1.0
	get_tree().reload_current_scene()
