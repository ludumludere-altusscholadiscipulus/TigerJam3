extends Node2D

const fading = preload("res://Fade.tscn")


# Called when the node enters the scene tree for the first time.
func _ready():
	var object = fading.instance()
	object.fade_in = true
	add_child(object)
	$AnimationPlayer.play("idle")
	
func _physics_process(delta):
	if Input.is_action_just_pressed("ui_cancel"):
		back_to_menu()

func back_to_menu():
	var object = fading.instance()
	object.fade_in = false
	add_child(object)
	yield(get_tree().create_timer(1),"timeout")
	get_tree().change_scene("res://Main Menu.tscn")
