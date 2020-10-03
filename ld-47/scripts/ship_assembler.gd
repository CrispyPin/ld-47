extends Node2D


var scalingFactor =1# scale.x


# Called when the node enters the scene tree for the first time.


var top
var bottom

var modules


var enabledTopModules
var enabledBottomModules

func _ready():
	top = $Top 
	bottom = $Bottom 
	
	#should probably only contain preloads
	modules = [preload("res://scenes/test_module.tscn").instance(),
					preload("res://scenes/test_module2.tscn").instance()]
	add_child(modules[0])
	add_child(modules[1])
	print(modules[0].pixelHeight)
	modules[0].position = position
	#topModules.append (preload("res://scenes/test_module.tscn"))
	
	enabledTopModules = modules
	enabledBottomModules = []
	reassemble()

#func addModule(sModuleScene):
	#var moduleScene = preload(sModuleScene)
	#var newModule = moduleScene.instance()
	

	
func reassemble():
	
	var current = 17/2
	for bottomModule in enabledBottomModules:
		current+=bottomModule.pixelHeight/2-1
		bottomModule.position.y = current
		current+=bottomModule.pixelHeight/2
	bottom.position.y = scalingFactor * (3+current)	
	
	
	current = -17/2
	for topModule in enabledTopModules:
		current-=topModule.pixelHeight/2-1
		topModule.position.y = current
		current-=topModule.pixelHeight/2
	top.position.y = -scalingFactor * (4 - current)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
