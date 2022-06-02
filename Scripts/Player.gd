extends KinematicBody2D

export (int) var run_speed = 100
export (int) var jump_speed = -400
export (int) var gravity = 1200

var velocity = Vector2()
var jumping = false
var initiated = false

func _ready():
	$AnimatedSprite.play("spawn")

func get_anim():
	var anim = ""
	if is_on_floor():
		if(velocity.x) != 0:
			anim = "run"
		else:
			anim = "idle"
	else:
		if velocity.y > 0:
			anim = "fall"
		else:
			anim = "jump"
	return anim

func get_input():
	velocity.x = 0
	var right = Input.is_action_pressed("right")
	var left = Input.is_action_pressed("left")
	var jump = Input.is_action_just_pressed("jump")
	
	if jump and not jumping:
		jumping = true
		velocity.y = jump_speed
	if right:
		$AnimatedSprite.flip_h = false
		velocity.x += run_speed
	if left:
		$AnimatedSprite.flip_h = true
		velocity.x -= run_speed

func _physics_process(delta):
	if(!initiated):
		return
	if is_on_floor() and jumping:
		jumping = false
	get_input()
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2(0, -1))
	$AnimatedSprite.play(get_anim())


func _on_AnimatedSprite_animation_finished():
	initiated = true
