extends Node2D

onready var textInst=load("res://UI/SmallMsg.tscn")
onready var playNoteTrack=load("res://samples/Play Notes On/Backing Track.ogg")

var play_note = true

var delta_sum_ := 0.0

var left := []

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
	42: {
		"color": Color.blue,
		"key": "down",
		"node": get_node("buttons/down"),
		"queue": []
	},
	41: {
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
	37: {
		"call": "snare",
	},
	38: {
		"call": "hat_closed",
	},
	39: {
		"call": "hat_open",
	}
}

var animation_queue := []

func _ready() -> void:
	for s in stuff.values():
		s.node.color = s.color
	if play_note:
		$music.stream=playNoteTrack
		mute_all()
#	mute_all()
#	$music.play()
#	$Sample1.play()
#	$Sample2.play()
#	$Sample3.play()
#	$Sample4.play()


func _process(delta):
	delta_sum_ += delta
	
	for s in stuff.values():
		if Input.is_action_just_pressed(s.key):
			if not s.queue.empty():
				if s.queue.front().test_hit(delta_sum_):
#					s.node.perfect()
					s.queue.pop_front().hit(s.node.global_position)
					perfect(s.node.global_position)
					print("hit")
					if play_note:
						var node_nr=1
						match s.key:
							"left": node_nr=1
							"up": node_nr=2
							"down": node_nr=3
							"right": node_nr=4
						$Timers.get_node("Exp"+str(node_nr)).start_expiration()
				else:
					early(s.node.global_position)
					$Wrong.play()
					print("TOO EARLY")
			else:
				print("WUT??")
				
		if not s.queue.empty():
			if s.queue.front().test_miss(delta_sum_):
				s.queue.pop_front().miss()
				miss(s.node.global_position)
				print("miss")

	for s in stuff.values():
		s.node.pressed = Input.is_action_pressed(s.key)
	if delta_sum_ >= 0.1 and not $MidiPlayer.playing:
		$MidiPlayer.play()
	if delta_sum_ >= 1.1 and not $midi2.playing:
		$midi2.play()
	if delta_sum_ >= 1.1 and not $music.playing:
		$music.play()
#	if delta_sum_ >= 1.04 and not $Sample1.playing:
		if play_note:
			$Sample1.play()
			$Sample2.play()
			$Sample3.play()
			$Sample4.play()

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

func perfect(glo_pos):
	show_text(glo_pos,"YEAH!")

func early(glo_pos):
	show_text(glo_pos,"early")

func miss(glo_pos):
	show_text(glo_pos,"miss")
	
func show_text(glo_pos,text):
	var i = textInst.instance()
	$Notifications.add_child(i)
	i.global_position=glo_pos
	i.show_text(text)
	
func mute_all():
	$Sample1.volume_db=-80
	$Sample2.volume_db=-80
	$Sample3.volume_db=-80
	$Sample4.volume_db=-80

#func unmute_sound_by_nr(nr=1):
#	get_node("Sample"+str(nr)).play()
#	var new_timer=Timer.new()
#	$Timers.add_child(new_timer)
#	new_timer.wait_time=0.5
#	new_timer.connect("timeout", self, "note_expired", [nr])
#	new_timer.start()
#
#func note_expired(nr):
	
	
