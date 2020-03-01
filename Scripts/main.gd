extends Node

var current_line = null
var p1 = Vector2()
var p2 = p1

var last_mouse_pos = Vector2()

func _ready():
	
	yield(get_tree().create_timer(5), "timeout")
	

func _process(delta):
	
	last_mouse_pos = $cam.get_global_mouse_position()
	
	p2 = last_mouse_pos
	
	if current_line != null:
		current_line.set_ends(p1, p2)
		
func _input(event):
	
	if (event.is_action_released("ui_cancel")):
		get_tree().quit()



func _on_anim_animation_finished(anim_name):
	get_tree().change_scene("res://Tutorial.tscn")
