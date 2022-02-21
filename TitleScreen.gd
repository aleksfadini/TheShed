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
