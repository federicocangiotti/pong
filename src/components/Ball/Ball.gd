extends CharacterBody2D

const SPEED_INCREMENT: int = 50

var speed: int = 500
var direction: Vector2 = Vector2.ZERO
var collision: KinematicCollision2D
var collider
var normal: Vector2 = Vector2.ZERO

var has_not_been_scored: bool = true

signal goal(player)


func _ready():
	goal.connect(GameManager._on_ball_goal)

	var x_direction = (randi() & 2) - 1
	var y_direction = (randi() & 2) - 1
	velocity = Vector2(x_direction * speed, y_direction * speed)


func _physics_process(delta):
	collision = move_and_collide(velocity * delta)

	# stop if no collision is detected
	if !collision:
		return

	# get collider information
	collider = collision.get_collider()

	# get normal vector of collision
	normal = collision.get_normal()

	direction = velocity.normalized()
	direction = direction.bounce(normal)

	match collider.name:
		"Player1", "Player2":
			speed += SPEED_INCREMENT
			velocity = direction * speed
		"ScoreSpotLeft":
			if has_not_been_scored:
				velocity = Vector2.ZERO
				emit_signal("goal", "Player2")
				has_not_been_scored = false
		"ScoreSpotRight":
			if has_not_been_scored:
				velocity = Vector2.ZERO
				emit_signal("goal", "Player1")
				has_not_been_scored = false
		_:
			velocity = direction * speed
