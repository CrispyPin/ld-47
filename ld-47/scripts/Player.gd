extends KinematicBody2D

export var max_health = 4
var health


var rng = RandomNumberGenerator.new()
var gameOver = false
var RCScooldown = 0
var targetSpawner
var shipAssembler

var ctrl

func _ready():
	health = max_health
	ctrl = get_node("Node/Control")
	rng.randomize()
	targetSpawner = get_node("../TargetSpawner") 
	shipAssembler = get_node("Ship_assembler")
	
	addGrapple(Vector2())
	


var rotation_dir = 3.141592

var vecGrapplePoint = Vector2()

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

var angleTimer = 0

func _physics_process(delta):
	angleTimer+=delta
	
	ctrl.update()
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

		if bReGrab:
			#do checks for grapple
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

		velocity = Vector2(-speed, 0).rotated(rotation)
		velocity = move_and_slide(velocity)
	
	else:
		velocity = Vector2()


func _on_Control_draw():
	if bGrapple:
		ctrl.draw_arc((vecGrapplePoint-global_position).rotated(-rotation), 80, 0, 2*PI, 7, Color(1, 1, 0, 0.3), 2.0, true)

func change_health(amount):
	health += amount
	health = min(health, max_health)
	health = max(health, 0)
	if health <= 0:
		if shipAssembler.moduleFlags[3]:
			shipAssembler.setModuleTop(3, false)
			health = max_health
		else:
			game_over()
