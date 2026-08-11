extends Node

var sfx_wall_bounce_player: AudioStreamPlayer
var sfx_rachet_hit_player: AudioStreamPlayer
var sfx_point_scored_player: AudioStreamPlayer

signal sfx_wall_bounce
signal sfx_rachet_hit
signal sfx_point_scored


func _ready():
	sfx_wall_bounce_player = AudioStreamPlayer.new()
	sfx_rachet_hit_player = AudioStreamPlayer.new()
	sfx_point_scored_player = AudioStreamPlayer.new()

	add_child(sfx_wall_bounce_player)
	add_child(sfx_rachet_hit_player)
	add_child(sfx_point_scored_player)

	sfx_wall_bounce_player.stream = preload("res://assets/sounds/wall_bounce.wav")
	sfx_rachet_hit_player.stream = preload("res://assets/sounds/racket_hit.wav")
	sfx_point_scored_player.stream = preload("res://assets/sounds/point_scored.wav")

	sfx_wall_bounce.connect(play_sfx_wall_bounce)
	sfx_rachet_hit.connect(play_sfx_rachet_hit)
	sfx_point_scored.connect(play_sfx_point_scored)


func play_sfx_wall_bounce():
	sfx_wall_bounce_player.play()


func play_sfx_rachet_hit():
	sfx_rachet_hit_player.play()


func play_sfx_point_scored():
	sfx_point_scored_player.play()
