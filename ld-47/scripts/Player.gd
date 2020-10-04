extends KinematicBody2D

var rng = RandomNumberGenerator.new()
var gameOver = false
var RCScooldown = 0
var targetSpawner
var shipAssembler
func _ready():
	rng.randomize()
	targetSpawner = get_node("../TargetSpawner") 
	shipAssembler = get_node("Ship_assembler")
	
	#position.x = 200
	addGrapple(Vector2())


var rotation_dir = 3.141592

var vecGrapplePoint = Vector2()
#var vecNextGrapplePoint = Vector2()

# is grapple currenly active, is it grabbing anything = is ship "orbiting"
export (bool) var bGrapple = false

# grab next node when in correct position?
var bReGrab = false
var fGrappleDist = 0
export (int) var BaseSpeed = 200
export (int) var FastSpeed = 400
var speed = FastSpeed
#rotation = 3.1415
var velocity = Vector2()

func game_over():
	var ass = get_node("Ship_assembler")
	var assChilds = ass.get_children()
	
	for child in assChilds:
		var rigidbody = RigidBody2D.new()
		rigidbody.position = child.position
		rigidbody.gravity_scale = 0
		rigidbody.angular_velocity = rng.randf_range(-5,5)
		rigidbody.angular_damp = 0
		rigidbody.linear_damp = 0
		ass.remove_child(child)
		ass.add_child(rigidbody)
		rigidbody.add_child(child)
		child.position = Vector2()
		child.scale = ass.scale
		rigidbody.linear_velocity = Vector2(rng.randf_range(-1,1),
			rng.randf_range(-1,1)).normalized ()*70

	gameOver = true



func get_input():
	if Input.is_action_pressed("addGrapple"):
		var mousePos = get_global_mouse_position()
		var minDist = mousePos.distance_to(targetSpawner.targets[0].position)
		var targetPos = targetSpawner.targets[0].position
		for target in targetSpawner.targets:
			var dist = mousePos.distance_to(target.position)
			if dist < minDist:
				minDist = dist
				targetPos = target.position
				
		addGrapple(targetPos)

	if Input.is_action_pressed("removeGrapple"):
		removeGrapple()
		

#todo: some dist check/ snap
func removeGrapple():
	bGrapple = false;
	bReGrab = false;

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
	if (!gameOver):
		get_input()
		var modFlags = shipAssembler.moduleFlags
		
		#SPEED module
		if modFlags[0]:
			speed = FastSpeed
		else:
			speed = BaseSpeed
			
		#RCS module
		RCScooldown-=delta
		if modFlags[1] and RCScooldown<0:
			
			if Input.is_action_just_pressed("left"):
				RCScooldown = 5
				#position += Vector2(30, 0).rotated(rotation + PI/2)
				rotation -= PI/8
			if Input.is_action_just_pressed("right"):
				RCScooldown = 5
				#position -= Vector2(30, 0).rotated(rotation + PI/2)
				rotation += PI/8
		
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
	
	else:
		velocity = Vector2()
