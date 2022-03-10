extends Control


func _ready():
	pass # Replace with function body.

func update_health():
	match Globals.hearts_halfs:
		0:
			$HBox2/h1/Heart.state=0
			$HBox2/h2/Heart.state=0
			$HBox2/h3/Heart.state=0
			$HBox2/h4/Heart.state=0
			$HBox2/h5/Heart.state=0
			$HBox/h1/Heart.state=0
			$HBox/h2/Heart.state=0
			$HBox/h3/Heart.state=0
			$HBox/h4/Heart.state=0
			$HBox/h5/Heart.state=0
		1:
			$HBox2/h1/Heart.state=0
			$HBox2/h2/Heart.state=0
			$HBox2/h3/Heart.state=0
			$HBox2/h4/Heart.state=0
			$HBox2/h5/Heart.state=1
			$HBox/h1/Heart.state=0
			$HBox/h2/Heart.state=0
			$HBox/h3/Heart.state=0
			$HBox/h4/Heart.state=0
			$HBox/h5/Heart.state=0
		2:
			$HBox2/h1/Heart.state=0
			$HBox2/h2/Heart.state=0
			$HBox2/h3/Heart.state=0
			$HBox2/h4/Heart.state=0
			$HBox2/h5/Heart.state=2
			$HBox/h1/Heart.state=0
			$HBox/h2/Heart.state=0
			$HBox/h3/Heart.state=0
			$HBox/h4/Heart.state=0
			$HBox/h5/Heart.state=0
		3:
			$HBox2/h1/Heart.state=0
			$HBox2/h2/Heart.state=0
			$HBox2/h3/Heart.state=0
			$HBox2/h4/Heart.state=1
			$HBox2/h5/Heart.state=2
			$HBox/h1/Heart.state=0
			$HBox/h2/Heart.state=0
			$HBox/h3/Heart.state=0
			$HBox/h4/Heart.state=0
			$HBox/h5/Heart.state=0
		4:
			$HBox2/h1/Heart.state=0
			$HBox2/h2/Heart.state=0
			$HBox2/h3/Heart.state=0
			$HBox2/h4/Heart.state=2
			$HBox2/h5/Heart.state=2
			$HBox/h1/Heart.state=0
			$HBox/h2/Heart.state=0
			$HBox/h3/Heart.state=0
			$HBox/h4/Heart.state=0
			$HBox/h5/Heart.state=0
		5:
			$HBox2/h1/Heart.state=0
			$HBox2/h2/Heart.state=0
			$HBox2/h3/Heart.state=1
			$HBox2/h4/Heart.state=2
			$HBox2/h5/Heart.state=2
			$HBox/h1/Heart.state=0
			$HBox/h2/Heart.state=0
			$HBox/h3/Heart.state=0
			$HBox/h4/Heart.state=0
			$HBox/h5/Heart.state=0
		6:
			$HBox2/h1/Heart.state=0
			$HBox2/h2/Heart.state=0
			$HBox2/h3/Heart.state=2
			$HBox2/h4/Heart.state=2
			$HBox2/h5/Heart.state=2
			$HBox/h1/Heart.state=0
			$HBox/h2/Heart.state=0
			$HBox/h3/Heart.state=0
			$HBox/h4/Heart.state=0
			$HBox/h5/Heart.state=0
		7:
			$HBox2/h1/Heart.state=0
			$HBox2/h2/Heart.state=1
			$HBox2/h3/Heart.state=2
			$HBox2/h4/Heart.state=2
			$HBox2/h5/Heart.state=2
			$HBox/h1/Heart.state=0
			$HBox/h2/Heart.state=0
			$HBox/h3/Heart.state=0
			$HBox/h4/Heart.state=0
			$HBox/h5/Heart.state=0
		8:
			$HBox2/h1/Heart.state=0
			$HBox2/h2/Heart.state=2
			$HBox2/h3/Heart.state=2
			$HBox2/h4/Heart.state=2
			$HBox2/h5/Heart.state=2
			$HBox/h1/Heart.state=0
			$HBox/h2/Heart.state=0
			$HBox/h3/Heart.state=0
			$HBox/h4/Heart.state=0
			$HBox/h5/Heart.state=0
		9:
			$HBox2/h1/Heart.state=1
			$HBox2/h2/Heart.state=2
			$HBox2/h3/Heart.state=2
			$HBox2/h4/Heart.state=2
			$HBox2/h5/Heart.state=2
			$HBox/h1/Heart.state=0
			$HBox/h2/Heart.state=0
			$HBox/h3/Heart.state=0
			$HBox/h4/Heart.state=0
			$HBox/h5/Heart.state=0
		10:
			$HBox2/h1/Heart.state=2
			$HBox2/h2/Heart.state=2
			$HBox2/h3/Heart.state=2
			$HBox2/h4/Heart.state=2
			$HBox2/h5/Heart.state=2
			$HBox/h1/Heart.state=0
			$HBox/h2/Heart.state=0
			$HBox/h3/Heart.state=0
			$HBox/h4/Heart.state=0
			$HBox/h5/Heart.state=0
		11:
			$HBox2/h1/Heart.state=2
			$HBox2/h2/Heart.state=2
			$HBox2/h3/Heart.state=2
			$HBox2/h4/Heart.state=2
			$HBox2/h5/Heart.state=2
			$HBox/h1/Heart.state=0
			$HBox/h2/Heart.state=0
			$HBox/h3/Heart.state=0
			$HBox/h4/Heart.state=0
			$HBox/h5/Heart.state=1
		12:
			$HBox2/h1/Heart.state=2
			$HBox2/h2/Heart.state=2
			$HBox2/h3/Heart.state=2
			$HBox2/h4/Heart.state=2
			$HBox2/h5/Heart.state=2
			$HBox/h1/Heart.state=0
			$HBox/h2/Heart.state=0
			$HBox/h3/Heart.state=0
			$HBox/h4/Heart.state=0
			$HBox/h5/Heart.state=2
		13:
			$HBox2/h1/Heart.state=2
			$HBox2/h2/Heart.state=2
			$HBox2/h3/Heart.state=2
			$HBox2/h4/Heart.state=2
			$HBox2/h5/Heart.state=2
			$HBox/h1/Heart.state=0
			$HBox/h2/Heart.state=0
			$HBox/h3/Heart.state=0
			$HBox/h4/Heart.state=1
			$HBox/h5/Heart.state=2
		14:
			$HBox2/h1/Heart.state=2
			$HBox2/h2/Heart.state=2
			$HBox2/h3/Heart.state=2
			$HBox2/h4/Heart.state=2
			$HBox2/h5/Heart.state=2
			$HBox/h1/Heart.state=0
			$HBox/h2/Heart.state=0
			$HBox/h3/Heart.state=0
			$HBox/h4/Heart.state=2
			$HBox/h5/Heart.state=2
		15:
			$HBox2/h1/Heart.state=2
			$HBox2/h2/Heart.state=2
			$HBox2/h3/Heart.state=2
			$HBox2/h4/Heart.state=2
			$HBox2/h5/Heart.state=2
			$HBox/h1/Heart.state=0
			$HBox/h2/Heart.state=0
			$HBox/h3/Heart.state=1
			$HBox/h4/Heart.state=2
			$HBox/h5/Heart.state=2
		16:
			$HBox2/h1/Heart.state=2
			$HBox2/h2/Heart.state=2
			$HBox2/h3/Heart.state=2
			$HBox2/h4/Heart.state=2
			$HBox2/h5/Heart.state=2
			$HBox/h1/Heart.state=0
			$HBox/h2/Heart.state=0
			$HBox/h3/Heart.state=2
			$HBox/h4/Heart.state=2
			$HBox/h5/Heart.state=2
		17:
			$HBox2/h1/Heart.state=2
			$HBox2/h2/Heart.state=2
			$HBox2/h3/Heart.state=2
			$HBox2/h4/Heart.state=2
			$HBox2/h5/Heart.state=2
			$HBox/h1/Heart.state=0
			$HBox/h2/Heart.state=1
			$HBox/h3/Heart.state=2
			$HBox/h4/Heart.state=2
			$HBox/h5/Heart.state=2
		18:
			$HBox2/h1/Heart.state=2
			$HBox2/h2/Heart.state=2
			$HBox2/h3/Heart.state=2
			$HBox2/h4/Heart.state=2
			$HBox2/h5/Heart.state=2
			$HBox/h1/Heart.state=0
			$HBox/h2/Heart.state=2
			$HBox/h3/Heart.state=2
			$HBox/h4/Heart.state=2
			$HBox/h5/Heart.state=2
		19:
			$HBox2/h1/Heart.state=2
			$HBox2/h2/Heart.state=2
			$HBox2/h3/Heart.state=2
			$HBox2/h4/Heart.state=2
			$HBox2/h5/Heart.state=2
			$HBox/h1/Heart.state=1
			$HBox/h2/Heart.state=2
			$HBox/h3/Heart.state=2
			$HBox/h4/Heart.state=2
			$HBox/h5/Heart.state=2
		20:
			$HBox2/h1/Heart.state=2
			$HBox2/h2/Heart.state=2
			$HBox2/h3/Heart.state=2
			$HBox2/h4/Heart.state=2
			$HBox2/h5/Heart.state=2
			$HBox/h1/Heart.state=2
			$HBox/h2/Heart.state=2
			$HBox/h3/Heart.state=2
			$HBox/h4/Heart.state=2
			$HBox/h5/Heart.state=2
			
	$HBox2/h1/Heart.update_heart()
	$HBox2/h2/Heart.update_heart()
	$HBox2/h3/Heart.update_heart()
	$HBox2/h4/Heart.update_heart()
	$HBox2/h5/Heart.update_heart()
	$HBox/h1/Heart.update_heart()
	$HBox/h2/Heart.update_heart()
	$HBox/h3/Heart.update_heart()
	$HBox/h4/Heart.update_heart()
	$HBox/h5/Heart.update_heart()
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
