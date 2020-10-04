extends Sprite


var targetSpawner

func _ready():
	targetSpawner = get_node("/root/GameScene/TargetSpawner")

func NewTarget():
	var Asteroids = targetSpawner.asteroids
	var ClosestAsteroid = Asteroids[0]
	var SmallestDist = global_position.distance_to(Asteroids[0].global_position)
	for Asteroid in Asteroids:
		var dist = global_position.distance_to(Asteroids[0].global_position)

func _physics_process(delta):
	NewTarget()
	pass


