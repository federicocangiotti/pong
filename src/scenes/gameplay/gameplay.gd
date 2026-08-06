extends Node2D

@export var wall_thickness: float = 32.0

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


func _ready() -> void:
	get_viewport().size_changed.connect(_position_and_extend_walls)

	await get_tree().process_frame
	_position_and_extend_walls()


func _position_and_extend_walls() -> void:
	print("ciao")
	var viewport_size := get_viewport_rect().size

	top_wall.position = Vector2(viewport_size.x / 2.0, 0.0)
	top_wall_shape.shape.size = Vector2(viewport_size.x, wall_thickness)

	bottom_wall.position = Vector2(viewport_size.x / 2.0, viewport_size.y)
	bottom_wall_shape.shape.size = Vector2(viewport_size.x, wall_thickness)

	score_spot_left.position = Vector2(0.0, viewport_size.y / 2.0)
	score_spot_left_shape.shape.size = Vector2(wall_thickness, viewport_size.y)

	score_spot_right.position = Vector2(viewport_size.x, viewport_size.y / 2.0)
	score_spot_right_shape.shape.size = Vector2(wall_thickness, viewport_size.y)
