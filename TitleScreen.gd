extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
#	$Instructions.play("s")
	$Instructions/InstructionsAnim.play("show")
	pass # Replace with function body.

func _process(delta):
	if Input.is_action_pressed("ui_accept") or Input.is_action_pressed("ui_accept"):
		get_tree().change_scene("res://Main.tscn")
		# Move right.


func _on_Colors_timeout():
	var r_a=rand_range(0,1)
	var r_b=rand_range(0,1)
	var r_c=rand_range(0,1)
	$Titles/SlideFromUp/MegaTitle/Shed.modulate=Color(r_a,r_b,r_c)
	$Titles/SlideFromUp/MegaTitle/The.modulate=Color(r_a,r_c,r_b)
	$Titles/SlideFromUp/MegaTitle/Colors.wait_time=rand_range(0,1)
	$Titles/SlideFromUp/MegaTitle/Colors.start()
	pass # Replace with function body.
