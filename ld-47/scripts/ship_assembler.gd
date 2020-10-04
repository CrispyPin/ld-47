extends Node2D


var scalingFactor =1# scale.x


# Called when the node enters the scene tree for the first time.


var top
var bottom

var modules


var enabledTopModules
var enabledBottomModules

export(Array, bool) var moduleFlags

var topModuleFlags = [false]
var bottomModuleFlags = [false]

func _ready():
	top = $Top 
	bottom = $Bottom 
	
	#should probably only contain preloads
	modules = [preload("res://scenes/ModuleSpeed.tscn").instance(),#0 - speed
		preload("res://scenes/ModuleRCS.tscn").instance(),#1 - RCS
		preload("res://scenes/ModuleCannon.tscn").instance(),#2 - cannon
		preload("res://scenes/ModuleShield.tscn").instance()]#3 - sheild
												
	
	topModuleFlags.resize(len(modules))
	bottomModuleFlags.resize(len(modules))

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

var flipBit = false;
func get_input():
	if Input.is_action_just_pressed("module_debug"):
		setModuleBottom(0,flipBit)
		setModuleTop(1,flipBit)
		setModuleTop(2,flipBit)
		setModuleTop(3,flipBit)
		flipBit = !flipBit
		
func _physics_process(delta):
	get_input()
	
func comeBack(t,b):
	if b:
		add_child(t)
		t.position.x = 0
		t.position.y = 0
	else:
		remove_child(t)
	recComeBack(t,b)
	t.visible = b

func recComeBack(t,b):
	for child in t.get_children ():
		recComeBack(child,b)
	SetComeBack(t,b)
	
func SetComeBack(t,b):
	t.set_process(b)
	t.set_physics_process(b)
	t.set_pause_mode(b)

	
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
	
