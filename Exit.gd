extends Node2D

var delta_sum = 0
func _ready():
	$Instructions/InstructionsAnim.play("show")
	$Instructions/Arrows/Score.text=str(Globals.score)
	$Instructions/Arrows/Time.text=str(Globals.timer_tot) +" seconds"

func _process(delta):
	delta_sum += delta
	if delta_sum >=1.0:
		if Input.is_action_pressed("ui_accept") or Input.is_action_pressed("ui_accept"):
			Globals.next_stage=1
			open_tweet()
			Globals.reset_score()
#			get_tree().change_scene("res://Main.tscn")

func open_tweet():
	OS.shell_open("https://twitter.com/intent/tweet?url=https%3A%2F%2Fsoltunes.io%2Ftheshed&text=I%20just%20scored%20"+str(Globals.score)+"%20on%20The%20Shed%20by%20@Sol_Tunes%21%20%20Full%20version%20coming%20soon%2C%20where%20you%20can%20compete%20for%20WL%20spots%21Think%20you%20can%20beat%20me%3F&hashtags=SolanaNFTs%2CSolana%2CNFT%2CGameFi%2CSolTunes%2CTheShedScore")
