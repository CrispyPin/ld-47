extends Line2D


var point
var target_pointer
# Called when the node enters the scene tree for the first time.
func _ready():
	target_pointer = get_node("../..")

func _process(delta):
	point = target_pointer.global_position
	add_point(point)
	while get_point_count()>100:
		remove_point(0)

