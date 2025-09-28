extends ProgressBar

@onready var timer = $Timer
@onready var damage_bar = $Damagebar
@onready var player: CharacterBody2D = get_tree().get_root().get_node("Game/Player")
var health = 100

func process(delta):
	health = player.health
func _set_health(new_health):
	var prev_health = health
	health = min(max_value, new_health)
	value = health
	
	if health <= 0:
		queue_free()
	
	if health < prev_health:
		timer.start()
	else:
		damage_bar.value = health


func _on_timer_timeout() -> void:
	damage_bar.value = health
