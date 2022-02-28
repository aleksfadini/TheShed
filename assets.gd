extends Node

var clinks=[]

var playNoteTrack1=load("res://samples/Stage1/Stage1_Backing Track.ogg")
var playNoteTrack2=load("res://samples/Stage2/Stage2_Backing Track.ogg")
var playNoteTrack3=load("res://samples/Stage3/Stage3_Backing Track.ogg")
var kick

func _ready():
	pass # Replace with function body.

func load_clinks():
	for each in 16:
		clinks[each]=load("res://samples/DrumClinks/DrumClink_"+each+".ogg")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
