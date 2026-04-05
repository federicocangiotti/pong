extends Node

# variables
var player1_score: int = 0
var player2_score: int = 0

var rounds_played: int = 0
var max_rounds: int = 5

#events
signal update_ui(player)

func _ready() -> void:
	process_mode = Node.PROCESS_MODE_ALWAYS

# events callbacks
func _on_ball_goal(player: Variant) -> void:
	print("GOAL!")
	update_player_color(player)
	
	match player:
		"Player1":
			player1_score += 1
			emit_signal("update_ui", "Player1")
		"Player2":
			player2_score += 1
			emit_signal("update_ui", "Player2")
	
	rounds_played += 1
	await get_tree().create_timer(3.0).timeout
	restart_scene()

# functions
func update_player_color(player):
	var root  = get_tree().current_scene
	var point_winner = root.get_node("Game/" + player + "/ColorRect")
	
	print(root.get_tree_string_pretty())
	point_winner.color = Color.GREEN

func restart_scene():
	get_tree().reload_current_scene()
