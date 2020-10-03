extends Node2D


var scalingFactor =1# scale.x


# Called when the node enters the scene tree for the first time.
var top
var bottom
func _ready():
	top = $Top 
	bottom = $Bottom 
	reassemble()

func addModule(sModuleScene):
	var moduleScene = preload(sModuleScene)
	var newModule = moduleScene.instance()
	

	
func reassemble():
	top.position.x = -scalingFactor * (12)
	bottom.position.x = scalingFactor * (11)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
