extends Sprite

var asteroid

func _ready():
	asteroid = preload("res://scenes/Asteroid.tscn")
	
	

func _on_Area2D_body_entered(body):
	if body.name == "Player":
		var shipass = body.get_node("Ship_assembler")
		if shipass.moduleFlags[3]:
			shipass.setModuleTop(3, false)
			explode()
		else:
			body.game_over()

func explode():
	for i in range(3):
		var next = asteroid.instance()
		next.position = position
		next.linear_velocity = Vector2(0, rand_range(100, 500)).rotated(rand_range(0, PI*2))
		get_parent().add_child(next)
	get_parent().targets.remove(get_parent().targets.find(self))
	visible = false
	$Area2D.queue_free()
