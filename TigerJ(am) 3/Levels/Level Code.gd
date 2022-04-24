extends Node2D

export (int) var level
var completed : bool = false
const fading = preload("res://Fade.tscn")
const levels = ["res://Levels/Level 1.tscn","res://Levels/Level 2.tscn","res://Levels/Level 3.tscn","res://Levels/Level 4.tscn","res://Levels/Level 5.tscn",
"res://Levels/Level 6.tscn","res://Levels/Level 7.tscn","res://Levels/Level 8.tscn","res://Levels/Level 9.tscn","res://Levels/Level 10.tscn","res://Levels/Level 11.tscn",
"res://Levels/Level 12.tscn","res://Levels/Level 13.tscn","res://Levels/Level 14.tscn","res://Levels/Level 15.tscn","res://Levels/Level 16.tscn","res://Main Menu.tscn"]

func _ready():
	if BgMusic.stream.resource_path == "res://Sound + Music/UpbeatMusic3Extra.wav":
		BgMusic.switch_song(true)
	var object = fading.instance()
	object.fade_in = true
	add_child(object)

func _physics_process(delta):
	if $Timer.time_left > 0:
		$Label.text = str(stepify($Timer.time_left,0.01))
	
	if Input.is_action_just_pressed("walk_right") or Input.is_action_just_pressed("walk_left") or Input.is_action_just_pressed("jump"):
		if completed:
			nextlevel(level+1)
	
	if completed:
		$Player.onair = false
		$Player.fall_damage = false

func _on_Start_body_entered(body):
	if body.name == "Player" and body.rewind_time:
		BgMusic.switch_song(true)
		body.rewind_time = false
		body.rerewind_time = true

func _on_End_body_entered(body):
	if body.name == "Player":
		BgMusic.switch_song(false)
		body.rewind_time = true
		if !completed:
			completed = true
			$Timer.stop()

func _on_Timer_timeout():
	death()

func _on_Player_player_moved():
	$Timer.start()

func death():
	get_node("Player").visible = false
	BgMusic.hurt()
	var object = fading.instance()
	object.fade_in = false
	add_child(object)
	yield(get_tree().create_timer(1),"timeout")
	get_tree().reload_current_scene()

func nextlevel(i : int):
	var object = fading.instance()
	object.fade_in = false
	add_child(object)
	yield(get_tree().create_timer(1),"timeout")
	get_tree().change_scene(levels[i])
	
