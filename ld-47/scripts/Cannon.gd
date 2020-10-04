extends Sprite


var targetSpawner
var TargetAsteroid
func _ready():
	targetSpawner = get_node("/root/GameScene/TargetSpawner")

func NewTarget():
	var Asteroids = targetSpawner.asteroids
	TargetAsteroid = null
	var SmallestDist = global_position.distance_to(Asteroids[0].global_position)
	for Asteroid in Asteroids:
		var dist = global_position.distance_to(Asteroid.global_position)
		if dist <= SmallestDist and dist < 400:
			TargetAsteroid = Asteroid
			SmallestDist = dist

var bTargeting = false
var fShootWait = 0

func _physics_process(delta):
	if !TargetAsteroid:
		bTargeting = false
	if (!bTargeting):
		NewTarget()
		if (TargetAsteroid):
			bTargeting = true
			fShootWait = 3
			
		get_child(0).rotation = rotation + PI
	else:
		get_child(0).rotation = get_angle_to(TargetAsteroid.global_position) + PI/2
		
		fShootWait-=delta
		if fShootWait < 0:
			TargetAsteroid.explode()
			bTargeting = false

