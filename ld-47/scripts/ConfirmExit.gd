extends Panel

func _ready():
	visible = false


func _process(delta):
	if Input.is_action_just_pressed("Quit"):
		visible = !visible
		get_tree().paused = visible
	if Input.is_action_just_pressed("restart"):
		get_tree().reload_current_scene()
	


func _on_ExitButton_pressed():
	get_tree().quit()


func _on_ResumeButton_pressed():
	visible = false
	get_tree().paused = false
