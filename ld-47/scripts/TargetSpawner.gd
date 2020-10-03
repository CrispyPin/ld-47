extends Node

export var track_width = 1024
export var generate_ahead = 512

export var max_dist = 128
export var min_dist = 32

var target_scene
var player

var targets = []
var next_dist

func _ready():
	target_scene = preload("res://scenes/Target.tscn")
	player = get_node("../Player")
	spawn_first()

func spawn_first():
	var new_target = target_scene.instance()
	new_target.position.y = 0#-generate_ahead
	new_target.position.x = 0#randi() % track_width
	targets.append(new_target)
	add_child(new_target)
	new_dist()

func _process(_delta):
	if targets[-1].position.y - player.position.y < generate_ahead:
		spawn_target()


func spawn_target():
	var new_target = target_scene.instance()
	new_target.position.y = targets[-1].position.y - next_dist
	new_target.position.x = randi() % track_width
	targets.append(new_target)
	add_child(new_target)
	new_dist()

func new_dist():
	next_dist = randi() % (max_dist - min_dist) + min_dist

