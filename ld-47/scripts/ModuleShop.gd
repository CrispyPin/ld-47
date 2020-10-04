extends RichTextLabel


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var resourceAmount = [0,0,0]


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
	moduleResourceNeeded.append([1,1,1])
	moduleResourceNeeded.append([0,0,0])
	moduleResourceNeeded.append([0,0,0])
	moduleResourceNeeded.append([0,0,0])
	
	assembler = get_node("/root/GameScene/Player/Ship_assembler")
	

var bNewModulesAvaliable = false

func _process(delta):
	if Input.is_action_just_pressed("Next_shop_item"):
		moduleIndex = (moduleIndex+1)%len(moduleNames)
	if (assembler.moduleFlags):#angry optimization noises
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
	

	

		
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
