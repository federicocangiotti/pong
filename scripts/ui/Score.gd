extends Control

func _ready():
	GameManager.update_ui.connect(_on_update_ui)
	_on_update_ui("Player1")
	_on_update_ui("Player2")

func _on_update_ui(player) -> void:
	var point_winner = get_node(player)
	
	match (player):
		"Player1":
			point_winner.text = str(GameManager.player1_score)
		"Player2":
			point_winner.text = str(GameManager.player2_score)
