extends Node2D

onready var textInst=load("res://UI/SmallMsg.tscn")

var delta_sum_ := 0.0

var left := []

onready var stuff := {
	60: {
		"color": Color.purple,
		"key": "left",
		"node": get_node("buttons/left"),
		"queue": []
	},
	61: {
		"color": Color.aqua,
		"key": "up",
		"node": get_node("buttons/up"),
		"queue": []
	},
	62: {
		"color": Color.blue,
		"key": "down",
		"node": get_node("buttons/down"),
		"queue": []
	},
	63: {
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
				else:
					early(s.node.global_position)
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
	
	if delta_sum_ >= 1.0 and not $music.playing:
		$music.play()
		$midi2.play()

func _on_midi_event(channel, event):
	if channel.track_name == "animation":
		
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
	if channel.track_name == "animation":
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
