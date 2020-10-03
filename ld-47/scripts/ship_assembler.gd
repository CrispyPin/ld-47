extends Node2D


var scalingFactor =1# scale.x


# Called when the node enters the scene tree for the first time.


var top
var bottom

var modules


var enabledTopModules
var enabledBottomModules

export(Array, bool) var moduleFlags

var topModuleFlags = [false,false]
var bottomModuleFlags = [false,false]

func _ready():
	top = $Top 
	bottom = $Bottom 
	
	#should probably only contain preloads
	modules = [preload("res://scenes/test_module.tscn").instance(),
			preload("res://scenes/test_module2.tscn").instance()]
	
	for module in modules:
		add_child(module)
		module.position.x = 0
		module.position.y = 0
		

	reassemble()

func setModuleTop(i,b):
	topModuleFlags[i] = b
	reassemble()
func setModuleBottom(i,b):
	bottomModuleFlags[i] = b
	reassemble()

func get_input():
	if Input.is_action_pressed("module_debug"):
		setModuleTop(1,true)
		print("asdasd")
		
func _physics_process(delta):
	get_input()
	
func comeBack(thing,b):
	thing.set_process(b)
	thing.visible = b
	thing.position.x = 0
	thing.position.y = 0

	
func reassemble():
	enabledBottomModules = []
	enabledTopModules = []
	
	moduleFlags.resize (len(modules))
	for i in range(len(modules)):
		comeBack(modules[i],false)
		moduleFlags[i] = false
		
		if topModuleFlags[i]:
			comeBack(modules[i],true)
			enabledTopModules.append(modules[i])
			moduleFlags[i] = true
			
		if bottomModuleFlags[i]:
			comeBack(modules[i],true)
			enabledBottomModules.append(modules[i])
			moduleFlags[i] = true
		
	
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
	
