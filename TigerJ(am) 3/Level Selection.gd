extends Node2D

var selection_value : int
const not_selected = preload("res://LevelSelectionButtons.png")
const selected = preload("res://LevelSelectionButtonsSelected.png")
const fading = preload("res://Fade.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	var object = fading.instance()
	object.fade_in = true
	add_child(object)

func _physics_process(delta):
	
	if selection_value < 0:
		selection_value = 0
	if selection_value > 15:
		selection_value = 15
	
	if Input.is_action_just_pressed("ui_up"):
		selection_value -= 4
		BgMusic.select()
	if Input.is_action_just_pressed("ui_down"):
		selection_value += 4
		BgMusic.select()
	if Input.is_action_just_pressed("walk_left"):
		selection_value -= 1
		BgMusic.select()
	if Input.is_action_just_pressed("walk_right"):
		selection_value += 1
		BgMusic.select()
	if Input.is_action_just_pressed("ui_cancel"):
		back_to_menu()
	if Input.is_action_just_pressed("ui_accept"):
		go_to_level(selection_value)
		BgMusic.accept()
	
	if selection_value == 0:
		$Sprite.texture = selected
		$Sprite2.texture = not_selected
		$Sprite3.texture = not_selected
		$Sprite4.texture = not_selected
		$Sprite5.texture = not_selected
		$Sprite6.texture = not_selected
		$Sprite7.texture = not_selected
		$Sprite8.texture = not_selected
		$Sprite9.texture = not_selected
		$Sprite10.texture = not_selected
		$Sprite11.texture = not_selected
		$Sprite12.texture = not_selected
		$Sprite13.texture = not_selected
		$Sprite14.texture = not_selected
		$Sprite15.texture = not_selected
		$Sprite16.texture = not_selected
	elif selection_value == 1:
		$Sprite2.texture = selected
		$Sprite.texture = not_selected
		$Sprite3.texture = not_selected
		$Sprite4.texture = not_selected
		$Sprite5.texture = not_selected
		$Sprite6.texture = not_selected
		$Sprite7.texture = not_selected
		$Sprite8.texture = not_selected
		$Sprite9.texture = not_selected
		$Sprite10.texture = not_selected
		$Sprite11.texture = not_selected
		$Sprite12.texture = not_selected
		$Sprite13.texture = not_selected
		$Sprite14.texture = not_selected
		$Sprite15.texture = not_selected
		$Sprite16.texture = not_selected
	elif selection_value == 2:
		$Sprite3.texture = selected
		$Sprite.texture = not_selected
		$Sprite2.texture = not_selected
		$Sprite4.texture = not_selected
		$Sprite5.texture = not_selected
		$Sprite6.texture = not_selected
		$Sprite7.texture = not_selected
		$Sprite8.texture = not_selected
		$Sprite9.texture = not_selected
		$Sprite10.texture = not_selected
		$Sprite11.texture = not_selected
		$Sprite12.texture = not_selected
		$Sprite13.texture = not_selected
		$Sprite14.texture = not_selected
		$Sprite15.texture = not_selected
		$Sprite16.texture = not_selected
	elif selection_value == 3:
		$Sprite4.texture = selected
		$Sprite.texture = not_selected
		$Sprite2.texture = not_selected
		$Sprite3.texture = not_selected
		$Sprite5.texture = not_selected
		$Sprite6.texture = not_selected
		$Sprite7.texture = not_selected
		$Sprite8.texture = not_selected
		$Sprite9.texture = not_selected
		$Sprite10.texture = not_selected
		$Sprite11.texture = not_selected
		$Sprite12.texture = not_selected
		$Sprite13.texture = not_selected
		$Sprite14.texture = not_selected
		$Sprite15.texture = not_selected
		$Sprite16.texture = not_selected
	elif selection_value == 4:
		$Sprite5.texture = selected
		$Sprite.texture = not_selected
		$Sprite2.texture = not_selected
		$Sprite3.texture = not_selected
		$Sprite4.texture = not_selected
		$Sprite6.texture = not_selected
		$Sprite7.texture = not_selected
		$Sprite8.texture = not_selected
		$Sprite9.texture = not_selected
		$Sprite10.texture = not_selected
		$Sprite11.texture = not_selected
		$Sprite12.texture = not_selected
		$Sprite13.texture = not_selected
		$Sprite14.texture = not_selected
		$Sprite15.texture = not_selected
		$Sprite16.texture = not_selected
	elif selection_value == 5:
		$Sprite6.texture = selected
		$Sprite.texture = not_selected
		$Sprite2.texture = not_selected
		$Sprite3.texture = not_selected
		$Sprite4.texture = not_selected
		$Sprite5.texture = not_selected
		$Sprite7.texture = not_selected
		$Sprite8.texture = not_selected
		$Sprite9.texture = not_selected
		$Sprite10.texture = not_selected
		$Sprite11.texture = not_selected
		$Sprite12.texture = not_selected
		$Sprite13.texture = not_selected
		$Sprite14.texture = not_selected
		$Sprite15.texture = not_selected
		$Sprite16.texture = not_selected
	elif selection_value == 6:
		$Sprite7.texture = selected
		$Sprite.texture = not_selected
		$Sprite2.texture = not_selected
		$Sprite3.texture = not_selected
		$Sprite4.texture = not_selected
		$Sprite5.texture = not_selected
		$Sprite6.texture = not_selected
		$Sprite8.texture = not_selected
		$Sprite9.texture = not_selected
		$Sprite10.texture = not_selected
		$Sprite11.texture = not_selected
		$Sprite12.texture = not_selected
		$Sprite13.texture = not_selected
		$Sprite14.texture = not_selected
		$Sprite15.texture = not_selected
		$Sprite16.texture = not_selected
	elif selection_value == 7:
		$Sprite8.texture = selected
		$Sprite.texture = not_selected
		$Sprite2.texture = not_selected
		$Sprite3.texture = not_selected
		$Sprite4.texture = not_selected
		$Sprite5.texture = not_selected
		$Sprite6.texture = not_selected
		$Sprite7.texture = not_selected
		$Sprite9.texture = not_selected
		$Sprite10.texture = not_selected
		$Sprite11.texture = not_selected
		$Sprite12.texture = not_selected
		$Sprite13.texture = not_selected
		$Sprite14.texture = not_selected
		$Sprite15.texture = not_selected
		$Sprite16.texture = not_selected
	elif selection_value == 8:
		$Sprite9.texture = selected
		$Sprite.texture = not_selected
		$Sprite2.texture = not_selected
		$Sprite3.texture = not_selected
		$Sprite4.texture = not_selected
		$Sprite5.texture = not_selected
		$Sprite6.texture = not_selected
		$Sprite7.texture = not_selected
		$Sprite8.texture = not_selected
		$Sprite10.texture = not_selected
		$Sprite11.texture = not_selected
		$Sprite12.texture = not_selected
		$Sprite13.texture = not_selected
		$Sprite14.texture = not_selected
		$Sprite15.texture = not_selected
		$Sprite16.texture = not_selected
	elif selection_value == 9:
		$Sprite10.texture = selected
		$Sprite.texture = not_selected
		$Sprite2.texture = not_selected
		$Sprite3.texture = not_selected
		$Sprite4.texture = not_selected
		$Sprite5.texture = not_selected
		$Sprite6.texture = not_selected
		$Sprite7.texture = not_selected
		$Sprite8.texture = not_selected
		$Sprite9.texture = not_selected
		$Sprite11.texture = not_selected
		$Sprite12.texture = not_selected
		$Sprite13.texture = not_selected
		$Sprite14.texture = not_selected
		$Sprite15.texture = not_selected
		$Sprite16.texture = not_selected
	elif selection_value == 10:
		$Sprite11.texture = selected
		$Sprite.texture = not_selected
		$Sprite2.texture = not_selected
		$Sprite3.texture = not_selected
		$Sprite4.texture = not_selected
		$Sprite5.texture = not_selected
		$Sprite6.texture = not_selected
		$Sprite7.texture = not_selected
		$Sprite8.texture = not_selected
		$Sprite9.texture = not_selected
		$Sprite10.texture = not_selected
		$Sprite12.texture = not_selected
		$Sprite13.texture = not_selected
		$Sprite14.texture = not_selected
		$Sprite15.texture = not_selected
		$Sprite16.texture = not_selected
	elif selection_value == 11:
		$Sprite12.texture = selected
		$Sprite.texture = not_selected
		$Sprite2.texture = not_selected
		$Sprite3.texture = not_selected
		$Sprite4.texture = not_selected
		$Sprite5.texture = not_selected
		$Sprite6.texture = not_selected
		$Sprite7.texture = not_selected
		$Sprite8.texture = not_selected
		$Sprite9.texture = not_selected
		$Sprite10.texture = not_selected
		$Sprite11.texture = not_selected
		$Sprite13.texture = not_selected
		$Sprite14.texture = not_selected
		$Sprite15.texture = not_selected
		$Sprite16.texture = not_selected
	elif selection_value == 12:
		$Sprite13.texture = selected
		$Sprite.texture = not_selected
		$Sprite2.texture = not_selected
		$Sprite3.texture = not_selected
		$Sprite4.texture = not_selected
		$Sprite5.texture = not_selected
		$Sprite6.texture = not_selected
		$Sprite7.texture = not_selected
		$Sprite8.texture = not_selected
		$Sprite9.texture = not_selected
		$Sprite10.texture = not_selected
		$Sprite11.texture = not_selected
		$Sprite12.texture = not_selected
		$Sprite14.texture = not_selected
		$Sprite15.texture = not_selected
		$Sprite16.texture = not_selected
	elif selection_value == 13:
		$Sprite14.texture = selected
		$Sprite.texture = not_selected
		$Sprite2.texture = not_selected
		$Sprite3.texture = not_selected
		$Sprite4.texture = not_selected
		$Sprite5.texture = not_selected
		$Sprite6.texture = not_selected
		$Sprite7.texture = not_selected
		$Sprite8.texture = not_selected
		$Sprite9.texture = not_selected
		$Sprite10.texture = not_selected
		$Sprite11.texture = not_selected
		$Sprite12.texture = not_selected
		$Sprite13.texture = not_selected
		$Sprite15.texture = not_selected
		$Sprite16.texture = not_selected
	elif selection_value == 14:
		$Sprite15.texture = selected
		$Sprite.texture = not_selected
		$Sprite2.texture = not_selected
		$Sprite3.texture = not_selected
		$Sprite4.texture = not_selected
		$Sprite5.texture = not_selected
		$Sprite6.texture = not_selected
		$Sprite7.texture = not_selected
		$Sprite8.texture = not_selected
		$Sprite9.texture = not_selected
		$Sprite10.texture = not_selected
		$Sprite11.texture = not_selected
		$Sprite12.texture = not_selected
		$Sprite13.texture = not_selected
		$Sprite14.texture = not_selected
		$Sprite16.texture = not_selected
	elif selection_value == 15:
		$Sprite16.texture = selected
		$Sprite.texture = not_selected
		$Sprite2.texture = not_selected
		$Sprite3.texture = not_selected
		$Sprite4.texture = not_selected
		$Sprite5.texture = not_selected
		$Sprite6.texture = not_selected
		$Sprite7.texture = not_selected
		$Sprite8.texture = not_selected
		$Sprite9.texture = not_selected
		$Sprite10.texture = not_selected
		$Sprite11.texture = not_selected
		$Sprite12.texture = not_selected
		$Sprite13.texture = not_selected
		$Sprite14.texture = not_selected
		$Sprite15.texture = not_selected

func back_to_menu():
	var object = fading.instance()
	object.fade_in = false
	add_child(object)
	yield(get_tree().create_timer(1),"timeout")
	get_tree().change_scene("res://Main Menu.tscn")

func go_to_level(value : int):
	var object = fading.instance()
	object.fade_in = false
	add_child(object)
	yield(get_tree().create_timer(1),"timeout")
	if value == 0:
		get_tree().change_scene("res://Levels/Level 1.tscn")
	elif value == 1:
		get_tree().change_scene("res://Levels/Level 2.tscn")
	elif value == 2:
		get_tree().change_scene("res://Levels/Level 3.tscn")
	elif value == 3:
		get_tree().change_scene("res://Levels/Level 4.tscn")
	elif value == 4:
		get_tree().change_scene("res://Levels/Level 5.tscn")
	elif value == 5:
		get_tree().change_scene("res://Levels/Level 6.tscn")
	elif value == 6:
		get_tree().change_scene("res://Levels/Level 7.tscn")
	elif value == 7:
		get_tree().change_scene("res://Levels/Level 8.tscn")
	elif value == 8:
		get_tree().change_scene("res://Levels/Level 9.tscn")
	elif value == 9:
		get_tree().change_scene("res://Levels/Level 10.tscn")
	elif value == 10:
		get_tree().change_scene("res://Levels/Level 11.tscn")
	elif value == 11:
		get_tree().change_scene("res://Levels/Level 12.tscn")
	elif value == 12:
		get_tree().change_scene("res://Levels/Level 13.tscn")
	elif value == 13:
		get_tree().change_scene("res://Levels/Level 14.tscn")
	elif value == 14:
		get_tree().change_scene("res://Levels/Level 15.tscn")
	elif value == 15:
		get_tree().change_scene("res://Levels/Level 16.tscn")
