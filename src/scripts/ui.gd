extends Node

@export var scores: Control


func _ready():
	GameManager.ui_update_score.connect(_on_update_score)
	GameManager.ui_update_player_color_on_score.connect(_on_update_player_color)
	_on_update_score("Player1")
	_on_update_score("Player2")


func _on_update_score(player) -> void:
	var point_winner = scores.get_node(player)

	match (player):
		"Player1":
			point_winner.text = str(GameManager.first_player_score)
		"Player2":
			point_winner.text = str(GameManager.second_player_score)


func _on_update_player_color(player):
	# Hardcoded, fa schifo
	var point_winner = get_node("Game/" + player + "/ColorRect")
	point_winner.color = Color.GREEN
