extends RigidBody2D


func explode():
	for _i in range(5):
		var vel = Vector2(0, rand_range(100, 500)).rotated(rand_range(0, PI*2))
		get_parent().get_parent().add(2, position, vel)
	get_parent().get_parent().remove_instance(1, self)


func _on_Asteroid_body_entered(body):
	if body.name == "Player":
		var shipass = body.get_node("Ship_assembler")
		if !shipass.moduleFlags[3]:
			body.game_over()
		explode()
