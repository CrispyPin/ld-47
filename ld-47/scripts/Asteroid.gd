extends RigidBody2D

var type = 1

var player

func _ready():
	player = get_node("/root/GameScene/Player")
	

func _process(_delta):
	if type == 2:
		$Sprite/Overlay.visible = true
	if position.y - player.position.y > 1000:
		get_parent().get_parent().remove_instance(1, self)

func explode():
	for _i in range(5):
		var vel = Vector2(0, rand_range(100, 500)).rotated(rand_range(0, PI*2))
		get_parent().get_parent().add(2, position, vel, type)
	get_parent().get_parent().remove_instance(1, self)

func _on_Asteroid_body_entered(body):
	if body.name == "Player":
		var shipass = body.get_node("Ship_assembler")
		if !shipass.moduleFlags[3]:
			body.change_health(-1)
		call_deferred("explode")
		#explode()
