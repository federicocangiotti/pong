class_name Player
extends Node

@export var player_id: int
@export var player_name: String
@export var SPEED: int = 500
var screen_size


func _ready():
	# Assign node name based on player_id
	name = "Player" + str(player_id)

	screen_size = get_viewport().get_visible_rect().size


func _physics_process(delta):
	# PLAYER1_MOVE_UP, PLAYER2_MOVE_UP...ecc.
	var input_dir = Input.get_axis("PLAYER" + str(player_id) + "_MOVE_UP", "PLAYER" + str(player_id) + "_MOVE_DOWN")

	if input_dir != 0:
		self.position.y += input_dir * SPEED * delta
		self.position.y = clamp(self.position.y, 0, screen_size.y)
