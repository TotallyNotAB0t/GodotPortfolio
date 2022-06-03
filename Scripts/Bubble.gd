extends Node2D

export (String, MULTILINE) var bubble_text
var bubble_text_length = 0
var bubble_text_index = 0
var current_text = ""
var text_size_orig = 0
var entered = false
var closing = false

onready var lbltext = get_node("VBoxContainer/Label")
onready var ninerect = get_node("VBoxContainer/Label/NinePatchRect")
onready var timer = get_node("TimerEnter")
onready var collid = get_node("Area2D")
onready var animatedS = get_node("AnimatedSprite")
onready var box = get_node("VBoxContainer")

func _ready():
	text_size_orig = bubble_text.length()
	bubble_text_length = bubble_text.length()
	animatedS.visible = true
	box.visible = false

#Yes, this is a mess
func _on_Timer_timeout():
	if(entered and !closing):
		current_text += bubble_text[bubble_text_index]
		lbltext.text = current_text
		if(bubble_text_index < bubble_text_length -1):
			timer.start(0.04)
			bubble_text_index += 1

	else:
		if(bubble_text_length > 0):
			closing = true
			current_text.erase(bubble_text_length -1, 1)
			lbltext.text = current_text
			if(bubble_text_length > bubble_text_index):
				bubble_text_length = bubble_text_index +1
			bubble_text_length -= 1
			timer.start(0.04)
		else:
			closing = false
			bubble_text_index = 0
			bubble_text_length = text_size_orig
			animatedS.visible = true
			box.visible = false

func _on_Area2D_area_entered(_area):
	if(!closing):
		entered = true
		box.visible = true
		timer.start(0.1)
		animatedS.visible = false

func _on_Area2D_area_exited(_area):
	if(!closing and entered):
		entered = false
		timer.start(0.1)
