extends Node3D

@export var Laser: PackedScene

@export var muzzle_speed = 100
@export var millis_between_shots = 0.1
@onready var rof_timer = $Timer
var can_shoot = true

# Called when the node enters the scene tree for the first time.
func _ready():
	rof_timer.wait_time = millis_between_shots

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func shoot():
	if can_shoot:
		var new_laser = Laser.instantiate() 
		new_laser.global_transform = $".".global_transform
		new_laser.speed = muzzle_speed
		var scene_root = get_tree().current_scene
		scene_root.add_child(new_laser)
		#print("PLAYER POSITION", $"..".global_position)
		#print("LASER GUN POSITION", $".".global_position)
		can_shoot = false
		rof_timer.start()

func _on_timer_timeout():
	can_shoot = true
