extends Control

func _ready():
	pass # Replace with function body.

func show_lvl_msg():
	$Cont/Nr.text=str(Globals.next_stage)
	$Cont/AnimationPlayer.play("show")

func hide_msg():
	$Cont/AnimationPlayer.play("disappear")

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name=="disappear":
		pass
	if anim_name=="show":
		$Cont/AnimationPlayer.play("disappear")
