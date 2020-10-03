extends Node


export var load_distance = 2

var chunk
var player

var chunk_size = 100

func _ready():
	player = get_node("../Player")
	chunk = preload("res://scenes/Chunk.tscn")

func _process(_delta):
	var c_pos = player.position / chunk_size

