extends AudioStreamPlayer2D

var music_time : float

onready var sfx = $"Extra SFX"
const reversed_music = preload("res://Sound + Music/UpbeatMusic3ExtraReverse.wav")
const forward_music = preload("res://Sound + Music/UpbeatMusic3Extra.wav")
const hurt_sfx = preload("res://Sound + Music/HitReverse.wav")
const select = preload("res://Sound + Music/Blip_Select3Reverse.wav")
const accept = preload("res://Sound + Music/Blip_Select4Reverse.wav")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func switch_song(reverse : bool):
	if reverse:
		stream = reversed_music
		play(music_time)
	else:
		stream = forward_music
		play(music_time)

func _physics_process(delta):
	music_time = 60.28 - get_playback_position()

func hurt():
	sfx.stream = hurt_sfx
	sfx.play()
func select():
	sfx.stream = select
	sfx.play()
func accept():
	sfx.stream = accept
	sfx.play()
