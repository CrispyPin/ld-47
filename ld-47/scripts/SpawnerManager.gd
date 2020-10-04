extends Node

var items = [[], [], []]
var targets = []
var asteroids = []
var fragments = []

var _target
var _asteroid
var _fragment

func _init():
	_target = preload("res://scenes/Target.tscn")
	_asteroid = preload("res://scenes/Asteroid.tscn")
	_fragment = preload("res://scenes/Fragment.tscn")

func _ready():
	_update_lists()

func _update_lists():
	targets = items[0]
	asteroids = items[1]
	fragments = items[2]
	

func add(type, pos = Vector2(), vel = Vector2(), material = 0):
	var new = [_target, _asteroid, _fragment][type].instance()
	new.position = pos
	if new is RigidBody2D:
		new.linear_velocity = vel
	items[type].append(new)
	get_children()[type].add_child(new)
	new.type = material
	_update_lists()

func remove_type(type, i=0):
	items[type][i].queue_free()
	items[type].remove(i)
	_update_lists()

func remove_instance(type, instance):
	var i = items[type].find(instance)
	remove_type(type, i)
