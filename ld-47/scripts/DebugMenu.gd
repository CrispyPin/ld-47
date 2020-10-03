extends Panel

func _process(_delta):
	if Input.is_action_just_pressed("ui_home"):
		visible = !visible
	if Input.is_action_just_pressed("Quit"):
		get_tree().quit()
