extends Node3D

var ray_origin = Vector3()
var ray_target = Vector3()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

#func _physics_process(delta):
	#var mouse_position = get_viewport().get_mouse_position()
	#
	#var ray_length = 2000
	#var from = $Camera3D.project_ray_origin(mouse_position)
	#var to = from + $Camera3D.project_ray_normal(mouse_position) * ray_length
	#
	#var space = get_world_3d().direct_space_state
	#var ray_query = PhysicsRayQueryParameters3D.new()
	#
	#ray_query.from = from
	#ray_query.to = to
	#ray_query.collide_with_areas = true
	#var raycast_result = space.intersect_ray(ray_query)
#
	#if not raycast_result.is_empty():
		#var pos = raycast_result.position
		#var look_at_me = Vector3(pos.x, $Player.position.y, pos.z)
		#$Player.get_child(0).look_at(look_at_me, Vector3.UP)
