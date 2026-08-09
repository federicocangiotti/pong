extends Node2D

@export var wall_thickness: float = 32.0
var viewport_size: Vector2

@export var ball: CharacterBody2D

@export var player1: CharacterBody2D
@export var player2: CharacterBody2D

# Static bodies for the walls and score spots
@export var top_wall: StaticBody2D
@export var bottom_wall: StaticBody2D
@export var score_spot_left: StaticBody2D
@export var score_spot_right: StaticBody2D

# Shape2D children of the wall and score spot static bodies
@onready var top_wall_shape := top_wall.get_child(0)
@onready var bottom_wall_shape := bottom_wall.get_child(0)
@onready var score_spot_left_shape := score_spot_left.get_child(0)
@onready var score_spot_right_shape := score_spot_right.get_child(0)

@export var net: Line2D


func _ready() -> void:
	get_viewport().size_changed.connect(_position_and_extend_walls)
	get_viewport().size_changed.connect(_position_players)
	get_viewport().size_changed.connect(_position_net)

	await get_tree().process_frame

	_position_and_extend_walls()
	_position_players()
	_position_ball()
	_position_net()


func _update_viewport_size() -> void:
	viewport_size = get_viewport_rect().size


func _position_and_extend_walls() -> void:
	_update_viewport_size()

	top_wall.position = Vector2(viewport_size.x / 2.0, 0.0)
	top_wall_shape.shape.size = Vector2(viewport_size.x, wall_thickness)

	bottom_wall.position = Vector2(viewport_size.x / 2.0, viewport_size.y)
	bottom_wall_shape.shape.size = Vector2(viewport_size.x, wall_thickness)

	score_spot_left.position = Vector2(0.0, viewport_size.y / 2.0)
	score_spot_left_shape.shape.size = Vector2(wall_thickness, viewport_size.y)

	score_spot_right.position = Vector2(viewport_size.x, viewport_size.y / 2.0)
	score_spot_right_shape.shape.size = Vector2(wall_thickness, viewport_size.y)


func _position_players() -> void:
	_update_viewport_size()

	player1.position = Vector2(wall_thickness, viewport_size.y / 2.0)
	player2.position = Vector2(viewport_size.x - wall_thickness, viewport_size.y / 2.0)


func _position_ball() -> void:
	ball.position = Vector2(viewport_size.x / 2.0, viewport_size.y / 2.0)


func _position_net() -> void:
	net.points = [Vector2(viewport_size.x / 2.0, 0.0), Vector2(viewport_size.x / 2.0, viewport_size.y)]
