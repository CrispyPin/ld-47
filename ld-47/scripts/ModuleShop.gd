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

var player
var assembler

var moduleIndex = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	assembler = get_tree().root.get_node("/GameScene/Player/Ship_assembler")
	text = "SCRIPT"

	updateText()

#var moduleNames = 



func updateText():
	
	pass
	text = "Avaliable Resources:\n\n"
	
	for i in range(len(resourceAmount)):
		text+="Resource "+resourceNames[i]+": "+str(resourceAmount[i])
		text+=" units\n"
	
	text += "\nSelected module for construction:\n"
	text += moduleNames[moduleIndex]+"\n"
	
	text += "\nResources needed:\n"
	
	for i in range(len(resourceAmount)):
		text+="Resource "+resourceNames[i]+": "+str(resourceAmount[i])
		text+=" units\n"
		
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
