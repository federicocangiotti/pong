extends CharacterBody2D

# speed in pixels/sec
const SPEED: int = 500
var screen_size


func _ready():
	screen_size = get_viewport().get_visible_rect().size


func _physics_process(delta):
	var input_dir = Input.get_axis("move_up_player2", "move_down_player2")

	if input_dir != 0:
		position.y += input_dir * SPEED * delta
		position.y = clamp(global_position.y, 0, screen_size.y)
