extends KinematicBody2D



func _ready():
	pass # Replace with function body.

var rotation_dir = 3.141592

var vecGrapplePoint = Vector2()
#var vecNextGrapplePoint = Vector2()

# is grapple currenly active, is it grabbing anything = is ship "orbiting"
export (bool) var bGrapple = false

# grab next node when in correct position?
var bReGrab = false
var fGrappleDist = 0
export (int) var speed = 200
#rotation = 3.1415
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


#todo: some dist check/ snap
func addGrapple(pos):
	bGrapple = false;
	bReGrab = true;
	vecGrapplePoint = pos

#set vars to make ship rotate grapplepoint
func activateGrapple():
	bGrapple = true;
	bReGrab = false;
	fGrappleDist = (position-vecGrapplePoint).length()



func _physics_process(delta):
	get_input()
	var rotation_speed = 1;

	#rotation += rotation_speed * delta

	var diff = 0;

	if bReGrab:
		#do checks for grapple
		#if dot>0 activateGrapple()
		if velocity.dot(vecGrapplePoint-position)<0: #if aligned with grapple point
			activateGrapple()
	if bGrapple:
		#grapple stuff???
		#|| = constant

		position-=vecGrapplePoint
		position = position.clamped(fGrappleDist)
		position+=vecGrapplePoint

		var newRotation = velocity.project(vecGrapplePoint-position).rotated(PI/2).angle()

		if Vector2(1,0).rotated(newRotation).dot(Vector2(1,0).rotated(rotation))<0:
			newRotation+=PI
		rotation = newRotation

		#var arrNewShipAngles = (vecGrapplePoint-position).angle() + PI/2
		#arrNewShipAngles.append(arrNewShipAngles[0]+PI)
		#arrNewShipAngles.append(arrNewShipAngles[0]-PI)

		#var diff = PI*2
		#for ang in arrNewShipAngles:
		#	diff = min(abs(ang-rotation),diff)
		#for ang in arrNewShipAngles:

	#if bGrapple:
	#	diff = (vecGrapplePoint-position)
	#	diff = diff.normalized()/(diff.length()*diff.length())
	#velocity+=delta*diff*100000

	velocity = Vector2(-speed, 0).rotated(rotation)
	velocity = move_and_slide(velocity)

