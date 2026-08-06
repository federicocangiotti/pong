extends CanvasLayer

func _ready():
	# Register itself on UIManager for pause handling
	UIManager.ui_menu = self
	visible = false


func _on_exit_pressed() -> void:
	get_tree().quit()
