extends Area2D


var show_interaction_label = false

func _process(delta):
	$Label.visible = show_interaction_label



	if show_interaction_label and Input.is_action_just_pressed("interact"):
		
		get_tree().change_scene_to_file("res://Scenes/lvl_2.tscn")
		

func _on_body_entered(body):
	if body is Player:
		show_interaction_label = true
		
	

func _on_body_exited(body):
	if body is Player:
		show_interaction_label = false
