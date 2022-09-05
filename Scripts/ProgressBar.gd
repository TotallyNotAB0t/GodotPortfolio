extends Control

onready var timer
onready var progress_bar
onready var title
onready var content


func _ready():
	timer = $Timer
	progress_bar = $ProgressBar
	title = $TitleContainer
	content = $ContentContainer

func _on_Timer_timeout():
	progress_bar.value += 1
	if(progress_bar.value == 100):
		timer.stop()
	if(progress_bar.value == 50):
		title.show()
		content.show()


func _on_Area2D_area_entered(_area):
	timer.start()
