extends Node2D

var can_tp = false
export (String, FILE) var next_scene
export (NodePath) var player_node

func Teleport():
	var _error = get_tree().change_scene(next_scene)

func play_despawn_animation():
	player_node.find_node(AnimatedSprite).play("despawn")
	return player_node.find_node(AnimatedSprite)

func _on_Area2D_area_entered(_area):
	can_tp = true

func _on_Area2D_area_exited(_area):
	can_tp = false

func _physics_process(_delta):
	if(can_tp and Input.is_action_just_released("up")):
		yield (play_despawn_animation(), "animation_finished")
		Teleport()
