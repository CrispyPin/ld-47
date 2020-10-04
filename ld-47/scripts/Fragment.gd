extends RigidBody2D

var type = 0

func _on_Fragment_body_entered(body):
	if body.name == "Player":
		var module_shop = get_node("/root/GameScene/Camera2D/CanvasLayer/RichTextLabel")
		module_shop.addResource(type, 1)
		get_parent().get_parent().remove_instance(2, self)
