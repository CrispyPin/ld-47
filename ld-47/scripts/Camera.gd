extends Camera2D

var player

func _ready():
	player = get_node("../Player")

func _process(delta):
	position.y = player.position.y#min(position.y, player.position.y)
