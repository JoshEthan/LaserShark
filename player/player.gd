extends CharacterBody3D


const SPEED = 10.0
const JUMP_VELOCITY = 4.5

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y -= gravity * delta

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
	
	if Input.is_action_pressed("ui_accept"):
		$Model/LaserGun.shoot()

	follow_target()


func follow_target():
	var mouse_position = get_viewport().get_mouse_position()
	var ray_length = 2000
	var from = $Camera3D.project_ray_origin(mouse_position)
	var to = from + $Camera3D.project_ray_normal(mouse_position) * ray_length
	var space = get_world_3d().direct_space_state
	var ray_query = PhysicsRayQueryParameters3D.new()
	ray_query.from = from
	ray_query.to = to
	ray_query.collide_with_areas = true
	var raycast_result = space.intersect_ray(ray_query)
	if not raycast_result.is_empty():
		var pos = raycast_result.position
		var look_at_me = Vector3(pos.x, $".".position.y, pos.z)
		$Model.look_at(look_at_me, Vector3.UP, true)
		#print(look_at_me)
