extends Node

const MAX_ROUNDS: int = 5

var rounds_played: int = 0
var first_player_score: int = 0
var second_player_score: int = 0

signal ui_update_score(player: String)
signal ui_update_player_color_on_score(player: String)
signal ui_toggle_score_message(player: String)
signal ui_game_over(player: String)


func _ready() -> void:
	pass


func _on_ball_goal(player: String) -> void:
	match player:
		"Player1":
			first_player_score += 1
		"Player2":
			second_player_score += 1

	emit_signal("ui_update_score", player)
	emit_signal("ui_update_player_color_on_score", player)
	emit_signal("ui_toggle_score_message", player)
	print(player + " got a point!")

	rounds_played += 1

	if rounds_played >= MAX_ROUNDS:
		if first_player_score > second_player_score:
			emit_signal("ui_game_over", "Player1")
		else:
			emit_signal("ui_game_over", "Player2")
	else:
		await get_tree().create_timer(3.0, false).timeout
		_restart_scene()


func _restart_scene() -> void:
	get_tree().reload_current_scene()


func _restart_game() -> void:
	get_tree().reload_current_scene()
	rounds_played = 0
	first_player_score = 0
	second_player_score = 0
	get_tree().paused = not get_tree().paused
