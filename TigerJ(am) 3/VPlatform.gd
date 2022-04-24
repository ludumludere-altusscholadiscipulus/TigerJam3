extends KinematicBody2D

export (int) var y_distance
export (float) var time

var recorded_data = [] # this is our array we update when moving, check when recording
var rerecorded_data = []
var is_rewinding = false # we'll use this to disable this object when true. so we can add recorded data to it
var rewind_length = (60 * 10)
var rewind_ghost = load("res://objects/rewind_ghost.tscn") # direct to a sprite we'll use as a ghost

const idle_duration = 0.05

onready var tween = $Tween
onready var ani = $AnimatedSprite
# Called when the node enters the scene tree for the first time.
func _ready():
	tween.interpolate_property(self,"position",self.position,Vector2(self.position.x,y_distance),time,Tween.TRANS_SINE,Tween.EASE_IN_OUT,idle_duration)
	tween.interpolate_property(self,"position",Vector2(self.position.x,y_distance),self.position,time,Tween.TRANS_SINE,Tween.EASE_IN_OUT,time+idle_duration)
	tween.start()
	
func _physics_process(delta):
	if get_parent().completed:
		tween.stop_all()
	handle_rewind_function()

func handle_rewind_function():
	var ani_number = ani.get_index()
	var dir_number = 0

	if get_parent().get_node("Player").rewind_time: # DO REWIND
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
		if get_parent().get_node("Player").rerewind_time:
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
			
			recorded_data.push_front([ani.animation,global_position,ani.flip_h])
			
		if(recorded_data.size() > rewind_length):
			recorded_data.pop_back()
