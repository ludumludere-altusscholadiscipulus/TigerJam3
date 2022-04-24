extends Node2D

var text_option : int

onready var mainmenutext = $Label

const first_level = preload("res://Levels/Level 1.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	
	if text_option < 0:
		text_option = 0
	if text_option > 2:
		text_option = 2
	
	if text_option == 0:
		mainmenutext.text = "- yalP -\nnoitceleS leveL\nstiderC"
	elif text_option == 1:
		mainmenutext.text = "yalP\n- noitceleS leveL -\nstiderC"
	elif text_option == 2:
		mainmenutext.text = "yalP\nnoitceleS leveL\n- stiderC -"
	if Input.is_action_just_pressed("ui_up"):
		text_option -= 1
	if Input.is_action_just_pressed("ui_down"):
		text_option += 1
	
	if Input.is_action_just_pressed("confirm"):
		if text_option == 0:
			get_tree().change_scene("res://Levels/Level 1.tscn")
		elif text_option == 1:
			get_tree().change_scene("res://Level Selection.tscn")
		elif text_option == 2:
			get_tree().change_scene("res://Credits.tscn")
