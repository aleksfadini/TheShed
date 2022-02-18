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

func kick() -> void:
#	$kick.scale = Vector2(1.2, 1.2)
	$Drummer/Instrument.scale = Vector2(1.05, 1.05)
#	$Drummer/Body.position.y+=1

func snare() -> void:
	$Drummer/Body.position.y+=1
	$snare.position.y = 40
	
func hat_closed() -> void:
	$hat.position.y = 20

func hat_open() -> void:
	$hat.position.y = 40

func _process(delta) -> void:
	$Drummer/Body.position.y = lerp($Drummer/Body.position.y, 0, delta * 10.0)
	$Drummer/Instrument.scale = lerp($Drummer/Instrument.scale, Vector2(1, 1), delta * 10.0)
#	$kick.scale = lerp($kick.scale, Vector2(1, 1), delta * 10.0)
	$snare.position.y = lerp($snare.position.y, 0, delta * 10.0)
	$hat.position.y = lerp($hat.position.y, 0, delta * 10.0)
