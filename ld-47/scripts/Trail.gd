extends Line2D

var l = 50
var point
var target_pointer


func _ready():
	target_pointer = get_node("../..")

func _process(_delta):
	point = target_pointer.global_position
	add_point(point)
	while get_point_count() > l:
		remove_point(0)



func _on_TrailEmitter_tree_exiting():
	clear_points()
