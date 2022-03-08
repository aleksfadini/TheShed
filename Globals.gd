extends Node

var score = 0
var timer_tot = 0
var hearts_halfs=10
var next_stage=1

func _ready():
	reset_score()

func reset_score():
	score = 0
	timer_tot = 0
	hearts_halfs = 380
