extends Node2D

var can_tp = false
export (String, FILE) var next_scene

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func Teleport():
	var _error = get_tree().change_scene(next_scene)

func _on_Area2D_area_entered(_area):
	can_tp = true

func _on_Area2D_area_exited(_area):
	can_tp = false

func _physics_process(_delta):
	if(can_tp and Input.is_action_just_released("up")):
		Teleport()
