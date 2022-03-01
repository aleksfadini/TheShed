extends Node2D

onready var textInst=load("res://UI/SmallMsg.tscn")
var playNoteTrack=Assets.playNoteTrack1

var yeah_points=10
var miss_points=-2
var early_points=-2
var wut_points=-4
var score_tot=0
var timer_tot=0

var countdown=0

var play_note = true

var streak=0

var delta_sum_ := 0.0
var left := []

var stage=1


var spacebar_active=false

onready var stuff := {
	36: {
		"color": Color.purple,
		"key": "left",
		"node": get_node("buttons/left"),
		"queue": []
	},
	38: {
		"color": Color.aqua,
		"key": "up",
		"node": get_node("buttons/up"),
		"queue": []
	},
	41: {
		"color": Color.blue,
		"key": "down",
		"node": get_node("buttons/down"),
		"queue": []
	},
	42: {
		"color": Color.red,
		"key": "right",
		"node": get_node("buttons/right"),
		"queue": []
	}
}

var animation := {
	36: {
		"call": "kick",
	},
	38: {
		"call": "snare",
	},
	41: {
		"call": "kick",
	},
	42: {
		"call": "snare",
	}
}

var animation_queue := []

func _ready() -> void:
	for s in stuff.values():
		s.node.color = s.color
	setup_stage()
#	if play_note:
#	$music.stream=playNoteTrack
	mute_all()
	Globals.reset_score()
	update_score()
	$crt/UI/Health.update_health()

func _process(delta):
	delta_sum_ += delta
	
	for s in stuff.values():
		if Input.is_action_just_pressed(s.key):
			if not s.queue.empty():
				if s.queue.front().test_hit(delta_sum_):
#					s.node.perfect()
					s.queue.pop_front().hit(s.node.global_position)
					perfect(s.node.global_position,s.color)
					print("hit")
					if play_note:
						var node_nr=1
						match s.key:
							"left": node_nr=1
							"up": node_nr=2
							"down": node_nr=4
							"right": node_nr=3
						$Timers.get_node("Exp"+str(node_nr)).start_expiration()
						update_score(yeah_points)
						update_streak(1)
				else:
					play_random_clink()
					update_score(early_points)
					update_streak(0)
					early(s.node.global_position)
					print("TOO EARLY")
			else:
				play_random_clink()
				update_streak(0)
				update_score(wut_points)
				print("WUT??")
				
		if not s.queue.empty():
			if s.queue.front().test_miss(delta_sum_):
				play_random_clink()
				s.queue.pop_front().miss()
				miss(s.node.global_position)
				update_score(miss_points)
				update_streak(0)
				print("miss")

	for s in stuff.values():
		s.node.pressed = Input.is_action_pressed(s.key)
	if delta_sum_ >= 0.1 and not $midi1.playing:
#		$Timers/CountdownTimer.start()
		$midi1.play()
	if delta_sum_ >= 1.1 and not $midi2.playing:
		$midi2.play()
	if delta_sum_ >= 1.1 and not $music.playing:
		spacebar_active=true
		$music.play()
#	if delta_sum_ >= 1.04 and not $Sample1.playing:
		if play_note:
			$Sample1.play()
			$Sample2.play()
			$Sample3.play()
			$Sample4.play()
	if Input.is_action_pressed("ui_accept") or Input.is_action_pressed("ui_accept"):
		if spacebar_active:
			get_tree().change_scene("res://Exit.tscn")

func _on_midi_event(channel, event):
#	print("event: ", event)
#	print("channel: ", channel)
#	print("note: ", event.note)
#	print("track name: ", channel.track_name)
#	print("event type: ", event.type)
#	print("------------------")
	if channel.track_name == "Falcon":
#		print("note: ", str(event.note))
		var s = stuff.get(event.note)
		if s and event.type == 1:
			var i = preload("res://note.tscn").instance()
			add_child(i)
			i.expected_time     = delta_sum_ + 1.0
			i.global_rotation   = s.node.global_rotation
			i.global_position.y = -400
			i.global_position.x = s.node.global_position.x
			i.color             = s.color
			s.queue.push_back(i)

func _on_midi2_event(channel, event):
	if channel.track_name == "Falcon":
		var a = animation.get(event.note)
		if a and event.type == 1:
			$drum.call(a.call)

func perfect(glo_pos,color):
	show_text(glo_pos,"YEAH!",color)

func early(glo_pos):
	show_text(glo_pos,"early")

func miss(glo_pos):
	show_text(glo_pos,"miss")
	
func show_text(glo_pos,text,color=Color(1,1,1)):
	var i = textInst.instance()
	$Notifications.add_child(i)
	i.global_position=glo_pos
	if text=="YEAH!":
		i.modulate=color
	i.show_text(text)
	
func mute_all():
	$Sample1.volume_db=-80
	$Sample2.volume_db=-80
	$Sample3.volume_db=-80
	$Sample4.volume_db=-80

func update_score(score=0):
	score_tot+=score
	Globals.score=score_tot
	print("global score", Globals.score)
	$crt/UI/Score/Points.text=str(score_tot)
	if score==miss_points or score== early_points:
		Globals.hearts_halfs-=1
		$crt/UI/Health.update_health()
	if score==wut_points:
		Globals.hearts_halfs-=2
		$crt/UI/Health.update_health()
	if Globals.hearts_halfs<=0:
		get_tree().change_scene("res://Exit.tscn")

func _on_PlayTimer_timeout():
	timer_tot+=1
	Globals.timer_tot=timer_tot
	$crt/UI/Time/Points.text=str(timer_tot)

func update_streak(nr=0):
	if nr==0:
		streak=0
	else:
		streak+=nr
	if streak==3:
		show_msg("Streak\n3x!!!",1)
		update_score(10)
	if streak==5:
		show_msg("Streak\n5x!!!",2)
		update_score(20)
	if streak==10:
		show_msg("Streak\n10x!!!",3)
		update_score(50)
	if streak==20:
		show_msg("Streak\n20x!!!",4)
		update_score(200)
	if streak==50:
		show_msg("Streak\n50x!!",5)
		update_score(5000)

func show_msg(text_msg,lvl=1):
	$Msg/Cont/Label.text=text_msg
	match lvl:
		1:
			$Msg/Cont/BecomeBig.play("Lev1")
		2:
			$Msg/Cont/MiniParticles.emitting=true
			$Msg/Cont/BecomeBig.play("Lev2")
		3:
			$Msg/Cont/MiniParticles.emitting=true
			$Msg/Cont/BecomeBig.play("Lev3")
		4:
			$Msg/Cont/MiniParticles.emitting=true
			$Msg/Cont/BecomeBig.play("Lev4")
		5:
			$Msg/Cont/MiniParticles.emitting=true
			$Msg/Cont/BecomeBig.play("Lev5")

func _on_CountdownTimer_timeout():
	if countdown == 0:
		countdown_msg("1...")
		$Timers/CountdownTimer.wait_time=1
	if countdown == 1:
		countdown_msg("2...")
		$Timers/CountdownTimer.wait_time=1
	if countdown == 2:
		countdown_msg("1,")		
		$Timers/CountdownTimer.wait_time=0.5
	if countdown == 3:
		countdown_msg("2,")
		$Timers/CountdownTimer.wait_time=0.5
	if countdown == 4:
		countdown_msg("3,")
		$Timers/CountdownTimer.wait_time=0.5
	if countdown == 5:
		countdown_msg("4!")	
		$Timers/CountdownTimer.wait_time=0.5
	countdown+=1
	$Timers/CountdownTimer.start()

func countdown_msg(text):
	$Notifications/LvlMessage.show_msg(text)
	pass

func play_random_clink():
#	print("clinks: ", Assets.clinks)
	$Wrong.stream=Assets.clinks[randi() % Assets.clinks.size()]
#	$Wrong.stream=Assets.clinks[1]
	$Wrong.play()

func setup_stage():
	stage=Globals.next_stage
	if stage==1:
		$midi1.file=Assets.midiTrack1
		$midi2.file=Assets.midiTrack1
		$Sample1.stream=Assets.kickTrack1
		$Sample2.stream=Assets.snareTrack1
		$Sample3.stream=Assets.hatsTrack1
		$Sample4.stream=Assets.tomTrack1
		$music.stream=Assets.playNoteTrack1
	elif stage==2:
		$midi1.file=Assets.midiTrack2
		$midi2.file=Assets.midiTrack2
		$Sample1.stream=Assets.kickTrack2
		$Sample2.stream=Assets.snareTrack2
		$Sample3.stream=Assets.hatsTrack2
		$Sample4.stream=Assets.tomTrack2
		$music.stream=Assets.playNoteTrack2
		$Bg/Sprite.texture=Assets.bgStage2
	elif stage==3:
		$midi1.file=Assets.midiTrack3
		$midi2.file=Assets.midiTrack3
		$Sample1.stream=Assets.kickTrack3
		$Sample2.stream=Assets.snareTrack3
		$Sample3.stream=Assets.hatsTrack3
		$Sample4.stream=Assets.tomTrack3
		$music.stream=Assets.playNoteTrack3
		$Bg/Sprite.texture=Assets.bgStage2

func _on_music_finished():
	if stage==1:
		pass # Replace with function body.
