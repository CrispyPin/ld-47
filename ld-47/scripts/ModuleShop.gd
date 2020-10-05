extends RichTextLabel


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var resourceAmount = [0,0,0]

func addResource(index, amount):
	resourceAmount[index] += amount
	updateText()
	text += str(resourceAmount[index])

#0 -resource A
#1 -resource B
#2 -resource C

var resourceNames = ["A","B","C"]

var moduleNames = ["Speed","RCS","Cannon","Shield"]

var moduleResourceNeeded = []

var player
var assembler

var moduleIndex = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	text = ""
	moduleResourceNeeded.append([10,0,1])#speed
	moduleResourceNeeded.append([0,0,10])#rcs
	moduleResourceNeeded.append([10,0,0])#cannon
	moduleResourceNeeded.append([0,10,0])#shield
	
	assembler = get_node("/root/GameScene/Player/Ship_assembler")
	player = assembler.get_parent()
	

var bNewModulesAvaliable = false

func updateModuleIndex():
	var validModuleFound = false
	for i in range(len(moduleNames)):
		moduleIndex = (moduleIndex+1)%len(moduleNames)
		if !assembler.moduleFlags[moduleIndex]:
			break

var bTextInit = false

func _process(delta):
	
	if Input.is_action_just_pressed("Next_shop_item"):
		updateModuleIndex()
		updateText()
		
	if Input.is_action_just_pressed("Install_item") and bNewModulesAvaliable:
		var afford = true
		for i in range(len(resourceNames)):
			if moduleResourceNeeded[moduleIndex][i]>resourceAmount[i]:
				afford = false
		if afford:
			if (moduleIndex!=0):
				assembler.setModuleTop(moduleIndex,true)
			else:
				assembler.setModuleBottom(moduleIndex,true)
				
			for i in range(len(resourceAmount)):
				resourceAmount[i]=0
				pass
			updateModuleIndex()
		updateText()

	if !bTextInit:
		if assembler.moduleFlags:
			bTextInit = true
			updateText()


func updateText():
	
	bNewModulesAvaliable = false
	for flag in assembler.moduleFlags:
		if !flag:
			bNewModulesAvaliable = true
			pass
	
	text = ""
	if bNewModulesAvaliable:
		text += "Selected module for construction:\n\n"
		text += moduleNames[moduleIndex]+"\n\n"
	
	text += "Avaliable Resources:\n\n"
	
	for i in range(len(resourceAmount)):
		text+="Resource "+resourceNames[i]+": "+str(resourceAmount[i])
		if bNewModulesAvaliable:
			text+=" / " + str(moduleResourceNeeded[moduleIndex][i]) 
		text+=" units\n"
	
	text+="\nWARNING: Any construction will \ndiscard unused resources"
	text += "\n\nShip Health: " + str(player.health)
