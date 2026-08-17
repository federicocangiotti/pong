extends Node

# Dependency injection
var ui_menu: CanvasLayer = null


func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS


func _input(event):
	if event.is_action_pressed("MENU") and ui_menu:
		_toggle_pause()
		get_viewport().set_input_as_handled()


func _toggle_pause() -> void:
	_set_paused(not get_tree().paused)


func _set_paused(value: bool) -> void:
	get_tree().paused = value
	if ui_menu:
		ui_menu.visible = value
