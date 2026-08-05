extends Node

const MAX_ROUNDS: int = 5

var rounds_played: int = 0
var first_player_score: int = 0
var second_player_score: int = 0

signal ui_update_score(player: String)
signal ui_update_player_color_on_score(player: String)


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
	print(player + " got a point!")

	rounds_played += 1

	await get_tree().create_timer(3.0).timeout

	_restart_scene()


func _restart_scene():
	get_tree().reload_current_scene()
