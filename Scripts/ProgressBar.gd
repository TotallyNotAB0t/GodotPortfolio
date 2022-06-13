extends Control

onready var timer
onready var progress_bar


func _ready():
	timer = $Timer
	progress_bar = $ProgressBar

func _on_Timer_timeout():
	progress_bar.value += 1
	if(progress_bar.value == 100):
		timer.stop()


func _on_Area2D_area_entered(_area):
	timer.start()
