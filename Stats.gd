extends Node

class_name Stats

@export var max_HP = 10
var current_HP = max_HP

signal you_died_signal

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func take_hit(damage):
	current_HP -= damage
	print("I'm hit!! ", current_HP, "/", max_HP)
	
	if current_HP <= 0:
		die()
		
func die():
	emit_signal("you_died_signal")
