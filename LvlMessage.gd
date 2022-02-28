extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
func show_msg(text="1"):
	$Cont/Label.text=text
	$Cont/AnimationPlayer.play("show")

func hide_msg():
	$Cont/AnimationPlayer.play("disappear")
	


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name=="disappear":
		pass
	if anim_name=="show":
		$Cont/AnimationPlayer.play("disappear")
#		queue_free()
	pass # Replace with function body.
