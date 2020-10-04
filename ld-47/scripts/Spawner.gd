extends Node

export var track_width = 1024
export var generate_ahead = 1024

export var max_dist = 512
export var min_dist = 128

export var type = 0
export var firstPos = Vector2()

var player

var next_dist = 0

func _ready():
	player = get_node("../../Player")
	get_parent().add(type, firstPos)
	new_dist()


func _process(_delta):
	if player.position.y - get_parent().items[type][-1].position.y < generate_ahead:
		spawn()
	if player.position.y - get_parent().items[type][0].position.y < -generate_ahead:
		get_parent().remove_type(type)


func spawn():
	var pos = Vector2()
	pos.y = get_parent().items[type][-1].position.y - next_dist
	pos.x = randi() % track_width - track_width/2
	get_parent().add(type, pos, Vector2(), 2-type)
	new_dist()

func new_dist():
	randomize()
	next_dist = randi() % (max_dist - min_dist) + min_dist

