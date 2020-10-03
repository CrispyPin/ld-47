extends Node

var planet
var player

var planet_chunks = []

func _ready():
	planet = preload("res://scenes/Planet.tscn")
	player = get_node("../Player")

func _process(delta):
	pass
