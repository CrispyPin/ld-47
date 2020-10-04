extends Sprite


var targetSpawner
var ClosestAsteroid
func _ready():
	targetSpawner = get_node("/root/GameScene/TargetSpawner")

func NewTarget():
	var Asteroids = targetSpawner.asteroids
	ClosestAsteroid = null
	var SmallestDist = global_position.distance_to(Asteroids[0].global_position)
	for Asteroid in Asteroids:
		var dist = global_position.distance_to(Asteroid.global_position)
		if dist <= SmallestDist and dist < 400:
			ClosestAsteroid = Asteroid
			SmallestDist = dist

var a = true
func _physics_process(delta):
	if (true):
		#a = false
		NewTarget()
		if (ClosestAsteroid):
			ClosestAsteroid.explode()
