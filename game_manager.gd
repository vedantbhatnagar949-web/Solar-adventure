extends Node

@onready var score_label: Label = $"../CanvasLayer/score"


var score = 0

func add_point():
	score += 1
	score_label.text = "Coins Collected = " + str(score) 
	print(score)
	
	


	
	
	
