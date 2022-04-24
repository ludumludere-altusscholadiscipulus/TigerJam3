extends KinematicBody2D

signal player_moved

var speed = 300
var jump_speed = -450
var gravity = 800
var ispressed
var canstilljump
var onair : bool
var is_jumping : bool
var jumpWall = -300
var fall_damage : bool
var velocity = Vector2.ZERO

var recorded_data = [] # this is our array we update when moving, check when recording
var rerecorded_data = []
var is_rewinding = false # we'll use this to disable this object when true. so we can add recorded data to it
var rewind_length = (60 * 10)
var rewind_ghost = load("res://objects/rewind_ghost.tscn") # direct to a sprite we'll use as a ghost
var rewind_time : bool
var rerewind_time : bool
var moved : bool = false

const fall_limit = 800

onready var ani = $PlaceholderPlayer

func _ready():
	pass

func get_input():
	velocity.x = 0
	if Input.is_action_pressed("walk_right"):
		velocity.x += speed
		if !check_wall():
			ani.flip_h = true
		if !moved:
			moved = true
			emit_signal("player_moved")
	if Input.is_action_pressed("walk_left"):
		velocity.x -= speed
		if !check_wall():
			ani.flip_h = false
		if !moved:
			moved = true
			emit_signal("player_moved")

func _physics_process(delta):
	get_input()
	handle_rewind_function()
	
	if is_jumping and velocity.y >= 0:
		is_jumping = false
	
	if rewind_time or rerewind_time:
		velocity = Vector2(0,0)
	
	velocity.y += gravity * delta
	velocity = move_and_slide(velocity, Vector2.UP)
	if Input.is_action_just_pressed("jump"):
		if is_on_floor():
			jump()
		else:
			if check_wall():
				velocity.y = jumpWall
	
	if check_wall() and velocity.y > 30:
		velocity.y = 30
	
	#Animation
	if !rewind_time or !rerewind_time:
		if velocity.x == 0:
			if check_wall() and !is_on_floor():
				ani.animation = "wall"
			elif !is_on_floor():
				ani.animation = "jump"
			else:
				ani.animation = "idle"
		else:
			if is_on_floor():
				ani.animation = "walk"
			else:
				ani.animation = "jump"
	
	#Jump
	if Input.is_action_just_pressed("jump"):
		ispressed = true
		if canstilljump:
			jump()
		if !moved:
			moved = true
			emit_signal("player_moved")
		rememberJumpTime()

	if is_on_floor():
		canstilljump = true
		if ispressed == true:
			jump()
		if onair:
			onair = false
	else:
		coyoteTime()
		if !onair:
			onair = true

	if check_left_wall() and !is_on_floor() and !rewind_time and !rerewind_time:
		ani.flip_h = true

	if check_right_wall() and !is_on_floor() and !rewind_time and !rerewind_time:
		ani.flip_h = false
	
	fall_damage_check()

func rememberJumpTime():
	yield(get_tree().create_timer(0.15), "timeout")
	ispressed = false

func coyoteTime():
	yield(get_tree().create_timer(0.15), "timeout")
	canstilljump = false

func check_left_wall():
	return $Left_Raycast.is_colliding()

func check_right_wall():
	return $Right_Raycast.is_colliding()

func check_wall():
	return check_left_wall() or check_right_wall()

func jump():
	is_jumping = true
	velocity.y = jump_speed
	$"Jump SFX".play()

func fall_damage_check():
	if velocity.y >= fall_limit and onair:
		fall_damage = true
	elif velocity.y < fall_limit and onair:
		fall_damage = false
	
	if is_on_floor() and fall_damage:
		get_tree().reload_current_scene()

func handle_rewind_function():
	var ani_number = ani.get_index()
	var dir_number = 0

	if rewind_time: # DO REWIND
		is_rewinding = true
		if(recorded_data.size() > 0):
			var current_frame = recorded_data[0]
			#Set our values to the first frame of the array
			if(current_frame != null):
				ani.animation = current_frame[0]
				global_position = current_frame[1]
				ani.flip_h = current_frame[2]
				
				var ghost : Sprite = rewind_ghost.instance()
				ghost.texture = ani.frames.get_frame(ani.animation,ani.frame)
				ghost.global_position = global_position
				ghost.flip_h = ani.flip_h
				get_parent().add_child(ghost)
				
			#remove thet first frame as we've just used it
			recorded_data.pop_front()
			rerecorded_data.push_front([ani.animation,global_position,ani.flip_h])
			
	else: # WE are recording
		if rerewind_time:
			if(rerecorded_data.size() > 0):
				var current_frame = rerecorded_data[0]
				
				#Set our values to the first frame of the array
				if(current_frame != null):
					ani.animation = current_frame[0]
					global_position = current_frame[1]
					ani.flip_h = current_frame[2]
					
					var ghost : Sprite = rewind_ghost.instance()
					ghost.texture = ani.frames.get_frame(ani.animation,ani.frame)
					ghost.global_position = global_position
					ghost.flip_h = ani.flip_h
					get_parent().add_child(ghost)
					
				#remove thet first frame as we've just used it
				rerecorded_data.pop_front()
				recorded_data.push_front([ani.animation,global_position,ani.flip_h])
		else:
			is_rewinding = false
			
			if(ani.flip_h):
				dir_number = 1
			else:
				dir_number = 0
			
			print(dir_number)
			
			recorded_data.push_front([ani.animation,global_position,ani.flip_h])
		if(recorded_data.size() > rewind_length):
			recorded_data.pop_back()
