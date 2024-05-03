extends Node3D

@export var speed = 70
@export var damage = 1

const KILL_TIME = 2
var timer = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var forward_direction = global_transform.basis.z.normalized()
	global_translate(forward_direction * speed * delta * -1)
	
	timer += delta
	if timer >= KILL_TIME:
		queue_free()


func _on_area_3d_body_entered(body: Node):
	if body == get_parent().get_child(0):
		pass
	else:
		queue_free()

	if body.has_node("Stats"):
		var stats_node: Stats = body.find_child("Stats")
		stats_node.take_hit(damage)
