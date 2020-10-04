extends Node

export var track_width = 1024
export var generate_ahead = 1024

export var max_dist = 512
export var min_dist = 128

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
	new_target.position.x = 0
	targets.append(new_target)
	add_child(new_target)
	new_dist()

func _process(_delta):
	if player.position.y - targets[-1].position.y < generate_ahead:
		spawn_target()
	if player.position.y - targets[0].position.y < -generate_ahead:
		targets[0].queue_free()
		targets.remove(0)


func spawn_target():
	var new_target = target_scene.instance()
	new_target.position.y = targets[-1].position.y - next_dist
	new_target.position.x = randi() % track_width - track_width/2
	targets.append(new_target)
	add_child(new_target)
	new_dist()

func new_dist():
	randomize()
	next_dist = randi() % (max_dist - min_dist) + min_dist

