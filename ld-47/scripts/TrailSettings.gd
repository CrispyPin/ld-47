extends Node2D

export (int) var LineWidth = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	var line = get_node("Line/Line2D")
	line.width = LineWidth
