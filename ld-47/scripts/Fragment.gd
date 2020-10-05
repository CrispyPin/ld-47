extends RigidBody2D

var type = 0

var player
var sprite1
var sprite2


func _ready():
	player = get_node("/root/GameScene/Player")
	sprite1 = preload("res://sprites/asteroid_types/asteroid_sample_1.png")
	sprite2 = preload("res://sprites/asteroid_types/asteroid_sample_2.png")
	

func _process(_delta):
	if position.y - player.position.y > 1000:
		get_parent().get_parent().remove_instance(2, self)
	if type == 1:
		$Sprite.texture = sprite1
	if type == 2:
		$Sprite.texture = sprite2

func _on_Fragment_body_entered(body):
	if body.name == "Player":
		var module_shop = get_node("/root/GameScene/Camera2D/CanvasLayer/RichTextLabel")
		module_shop.addResource(type, 1)
		get_parent().get_parent().remove_instance(2, self)
