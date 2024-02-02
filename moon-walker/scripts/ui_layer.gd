extends CanvasLayer

@onready var time_label = $HUD/TimeLabel
@onready var win_screen = $WinScreen

func set_time_label(value):
	time_label.text = "Time: " + str(value)

func show_win_screen():
	win_screen.visible = true
	
	
