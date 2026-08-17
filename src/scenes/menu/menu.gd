extends CanvasLayer

func _ready():
	UIManager.ui_menu = self

	# Allign visibility to the tree's paused state
	visible = get_tree().paused


func _on_exit_pressed() -> void:
	get_tree().quit()


func _on_restart_game_pressed() -> void:
	GameManager._restart_game()
