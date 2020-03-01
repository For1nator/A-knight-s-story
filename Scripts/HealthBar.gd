extends Control
onready var health_bar = $HealthBarOver
onready var health_under = $HeathBarUnder
onready var update_tween = $update_Tween


export (Color) var healthy_color = Color.green
export (Color) var caution_color = Color.yellow
export (Color) var danger_color = Color.red
export (float,0,1,0.05) var caution_zone = 0.5
export (float,0,1,0.05) var danger_zone = 0.2

func _ready():
	health_bar.value = GlobalVars.playerhealth
func _process(delta):
	health_bar.value = GlobalVars.playerhealth
func _on_Health_updated(Health,amount):
	health_bar.value = GlobalVars.playerhealth
	update_tween.interpolate_property(health_under, "value" ,health_under.value, Health,0.4,Tween.TRANS_SINE,Tween.EASE_IN_OUT,0.4)
	update_tween.start()
	_assign_color(Health)
	
	
func _assign_color(health):
	if GlobalVars.playerhealth < health_bar.max_value * danger_zone:
		health_bar.tint_progress = danger_color
	elif GlobalVars.playerhealth  < health_bar.max_value * caution_zone:
		health_bar.tint_progress = caution_color
	else:
		health_bar.tint_progress = healthy_color
	



func _on_max_Health_updated(max_health):
	health_bar.max_value = max_health
	health_under.max_value = max_health

