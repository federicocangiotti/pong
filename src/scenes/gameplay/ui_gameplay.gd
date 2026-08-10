extends Node

@export var player1_data: Player
@export var player2_data: Player

@export var score_message_player1: RichTextLabel
@export var score_message_player2: RichTextLabel

@export var score_panel_player1: Label
@export var score_panel_player2: Label

@export var game_over_ui: CanvasLayer
@onready var game_over_message: RichTextLabel = game_over_ui.get_node("CenterContainer/Panel/CenterContainer/GameOverText")


func _ready():
	GameManager.ui_update_score.connect(_on_update_score)
	GameManager.ui_update_player_color_on_score.connect(_on_update_player_color)
	GameManager.ui_toggle_score_message.connect(_on_toggle_score_message)
	GameManager.ui_game_over.connect(_on_game_over)

	_on_update_score("Player1")
	_on_update_score("Player2")


func _on_update_score(player) -> void:
	match (player):
		"Player1":
			score_panel_player1.text = str(GameManager.first_player_score)
		"Player2":
			score_panel_player2.text = str(GameManager.second_player_score)


func _on_update_player_color(player):
	var winner
	match (player):
		"Player1":
			winner = player1_data.get_node("ColorRect")
		"Player2":
			winner = player2_data.get_node("ColorRect")
	winner.color = Color.GREEN


func _on_toggle_score_message(player):
	match (player):
		"Player1":
			score_message_player1.text = "[blink freq=2][color=#00FF00][b]" + player1_data.player_name + " got a point[/b][/color][/blink]"
		"Player2":
			score_message_player2.text = "[blink freq=2][color=#00FF00][b]" + player2_data.player_name + " got a point[/b][/color][/blink]"


func _on_game_over(player: String) -> void:
	match (player):
		"Player1":
			game_over_message.text = "[color=#FFFFFF][b][center]Game Over[/center]\n\nWinner: " + player1_data.player_name + "[/b][/color]"
		"Player2":
			game_over_message.text = "[color=#FFFFFF][b][center]Game Over[/center]\n\nWinner: " + player2_data.player_name + "[/b][/color]"

	game_over_ui.visible = true
