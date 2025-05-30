extends Node3D

var camera_rotation: Vector2 = Vector2.ZERO
var mouse_sensitivity:float = 0.001
var max_y_rotation: float = 1.2
# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		else:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)	

	if event is InputEventMouseMotion:
		var mouse_event: Vector2 = event.screen_relative * mouse_sensitivity
		camera_look(mouse_event)

func camera_look(mouse_movement: Vector2) -> void:
		camera_rotation += mouse_movement
		
		transform.basis = Basis()
		
		rotate_object_local(Vector3(0, 1, 0), -camera_rotation.x)
		rotate_object_local(Vector3(1,0,0), -camera_rotation.y)
		camera_rotation = clamp(camera_rotation.y, -max_y_rotation, max_y_rotation)
