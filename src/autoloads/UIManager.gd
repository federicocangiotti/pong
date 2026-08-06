extends Node

# Dependency injection
var ui_menu: CanvasLayer = null


func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS


func _input(event):
	if event.is_action_pressed("MENU"):
		toggle_pause()


func toggle_pause():
	get_tree().paused = !get_tree().paused
	ui_menu.visible = !ui_menu.visible
