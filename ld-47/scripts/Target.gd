extends Sprite

var type = 2

func _on_Area2D_body_entered(body):
	if body.name == "Player":
		var shipass = body.get_node("Ship_assembler")
		if shipass.moduleFlags[3]:
			shipass.setModuleTop(3, false)
		else:
			body.game_over()
		explode()

func explode():
	for _i in range(3):
		var vel = Vector2(0, rand_range(100, 500)).rotated(rand_range(0, PI*2))
		get_parent().get_parent().add(1, position, vel, type)
	get_parent().get_parent().remove_instance(0, self)

