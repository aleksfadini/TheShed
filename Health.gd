extends Control


func _ready():
	pass # Replace with function body.

func update_health():
	match Globals.hearts_halfs:
		0:
			$HBox/h1/Heart.state=0
			$HBox/h2/Heart.state=0
			$HBox/h3/Heart.state=0
			$HBox/h4/Heart.state=0
			$HBox/h5/Heart.state=0
		1:
			$HBox/h1/Heart.state=0
			$HBox/h2/Heart.state=0
			$HBox/h3/Heart.state=0
			$HBox/h4/Heart.state=0
			$HBox/h5/Heart.state=1
		2:
			$HBox/h1/Heart.state=0
			$HBox/h2/Heart.state=0
			$HBox/h3/Heart.state=0
			$HBox/h4/Heart.state=0
			$HBox/h5/Heart.state=2
		3:
			$HBox/h1/Heart.state=0
			$HBox/h2/Heart.state=0
			$HBox/h3/Heart.state=0
			$HBox/h4/Heart.state=1
			$HBox/h5/Heart.state=2
		4:
			$HBox/h1/Heart.state=0
			$HBox/h2/Heart.state=0
			$HBox/h3/Heart.state=0
			$HBox/h4/Heart.state=2
			$HBox/h5/Heart.state=2
		5:
			$HBox/h1/Heart.state=0
			$HBox/h2/Heart.state=0
			$HBox/h3/Heart.state=1
			$HBox/h4/Heart.state=2
			$HBox/h5/Heart.state=2
		6:
			$HBox/h1/Heart.state=0
			$HBox/h2/Heart.state=0
			$HBox/h3/Heart.state=2
			$HBox/h4/Heart.state=2
			$HBox/h5/Heart.state=2
		7:
			$HBox/h1/Heart.state=0
			$HBox/h2/Heart.state=1
			$HBox/h3/Heart.state=2
			$HBox/h4/Heart.state=2
			$HBox/h5/Heart.state=2
		8:
			$HBox/h1/Heart.state=0
			$HBox/h2/Heart.state=2
			$HBox/h3/Heart.state=2
			$HBox/h4/Heart.state=2
			$HBox/h5/Heart.state=2
		9:
			$HBox/h1/Heart.state=1
			$HBox/h2/Heart.state=2
			$HBox/h3/Heart.state=2
			$HBox/h4/Heart.state=2
			$HBox/h5/Heart.state=2
		10:
			$HBox/h1/Heart.state=2
			$HBox/h2/Heart.state=2
			$HBox/h3/Heart.state=2
			$HBox/h4/Heart.state=2
			$HBox/h5/Heart.state=2
	$HBox/h1/Heart.update_heart()
	$HBox/h2/Heart.update_heart()
	$HBox/h3/Heart.update_heart()
	$HBox/h4/Heart.update_heart()
	$HBox/h5/Heart.update_heart()
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
