extends Node

var clinks=[]
# audio assets
var playNoteTrack1=load("res://samples/Stage1/Stage1_100_Backing Track.ogg")
var playNoteTrack2=load("res://samples/Stage2/Stage2_115_Backing Track.ogg")
var playNoteTrack3=load("res://samples/Stage3/Stage3_130_Backing Track.ogg")
var kickTrack1=load("res://samples/Stage1/Stage1_100_Kick.ogg")
var kickTrack2=load("res://samples/Stage2/Stage2_115_Kick.ogg")
var kickTrack3=load("res://samples/Stage3/Stage3_Kick.ogg")
var snareTrack1=load("res://samples/Stage1/Stage1_100_Snare.ogg")
var snareTrack2=load("res://samples/Stage2/Stage2_115_Snare.ogg")
var snareTrack3=load("res://samples/Stage3/Stage3_130_Snare.ogg")
var hatsTrack1=load("res://samples/Stage1/Stage1_100_Hats.ogg")
var hatsTrack2=load("res://samples/Stage2/Stage2_115_Hats.ogg")
var hatsTrack3=load("res://samples/Stage3/Stage3_130_Hats.ogg")
var tomTrack1=load("res://samples/Stage1/Stage1_100_Toms.ogg")
var tomTrack2=load("res://samples/Stage2/Stage2_115_Toms.ogg")
var tomTrack3=load("res://samples/Stage3/Stage3_130_Toms.ogg")
#var midiTrack1=load("res://samples/Stage1/Stage1.mid")
var midiTrack1="res://samples/Stage1/Stage1_100.mid"
var midiTrack2="res://samples/Stage2/Stage2_115.mid"
var midiTrack3="res://samples/Stage3/Stage3_130.mid"
# video assets
#var bgStage1=load("res://graphics/BgEightiesBabyT3.png")
var bgStage2=load("res://graphics/BgNibiruCraters.png")
var bgStage3=load("res://graphics/BgBlackRunCastle.png")

func _ready():
	randomize()
	load_clinks()
	pass # Replace with function body.

func load_clinks():
	for each in 16:
		clinks.append(load("res://samples/DrumClinks/DrumClink_"+str(each)+".ogg"))
