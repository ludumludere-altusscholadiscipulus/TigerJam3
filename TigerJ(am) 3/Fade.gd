extends Node2D

export (bool) var fade_in

# Called when the node enters the scene tree for the first time.
func _ready():
	if fade_in:
		$AnimationPlayer.play("fade_in")
	else:
		$AnimationPlayer.play("fade_out")



func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "fade_in" or anim_name == "fade_out":
		queue_free()
