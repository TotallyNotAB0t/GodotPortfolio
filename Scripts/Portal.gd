extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var can_tp = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func test():
	print("a")

func _on_Area2D_area_entered(_area):
	can_tp = true

func _on_Area2D_area_exited(_area):
	can_tp = false


func _physics_process(_delta):
	if(can_tp and Input.is_action_just_released("up")):
		test()


