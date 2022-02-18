extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func show_text(text="PERFECT!!!"):
	$text/Label.text=text
	$LabelFade.play("show")
	$LabelMove.play("go_up")


func _on_LabelFade_animation_finished(anim_name):
	if anim_name == "show":
		queue_free()
	pass # Replace with function body.
