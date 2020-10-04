extends Sprite

var asteroid

func _ready():
	asteroid = preload("res://scenes/Asteroid.tscn")
	
	

func _on_Area2D_body_entered(body):
	if body.name == "Player":
		var shipass = body.get_node("Ship_assembler")
		if shipass.moduleFlags[3]:
			explode()
		else:
			body.game_over()

func explode():
	add_child(asteroid.instance())
