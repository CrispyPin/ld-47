extends KinematicBody2D



func _ready():
	pass # Replace with function body.

var rotation_dir = 0

var vecGrapplePoint = Vector2()
#var vecNextGrapplePoint = Vector2()

# is grapple currenly active, is it grabbing anything = is ship "orbiting"
export (bool) var bGrapple = false 

# grab next node when in correct position?
var bReGrab = false 
export (int) var speed = 200

var velocity = Vector2()

#func get_input():
	#velocity = Vector2()
#	pass
	#velocity = velocity.normalized() * speed

# set vars to grab the node when in position


func get_input():
	if Input.is_action_pressed("addGrapple"):
		addGrapple(get_global_mouse_position())
	#rotation_dir = 0
	#velocity = Vector2()
	#if Input.is_action_pressed('right'):
	#    rotation_dir += 1
	#if Input.is_action_pressed('left'):
	#    rotation_dir -= 1
	#if Input.is_action_pressed('down'):
	#    velocity = Vector2(-speed, 0).rotated(rotation)
	#if Input.is_action_pressed('up'):
	#    velocity = Vector2(speed, 0).rotated(rotation)

func addGrapple(pos):
	bGrapple = false;
	bReGrab = true;
	vecGrapplePoint = pos

func updateGrapples(): #"physics" for grapple
	bGrapple = false

func _physics_process(delta):
	get_input()
	var rotation_speed = 1;
	velocity = Vector2(speed, 0).rotated(rotation)
	rotation_dir = 1;
	rotation += rotation_dir * rotation_speed * delta
		
	var diff = 0;
	
	#if bGrapple:
	#	diff = (vecGrapplePoint-position)
	#	diff = diff.normalized()/(diff.length()*diff.length())
	#velocity+=delta*diff*100000
	
	velocity = Vector2(-speed, 0).rotated(rotation)
	velocity = move_and_slide(velocity)

