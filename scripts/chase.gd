extends Node2D
@onready var timer_2: Timer = $Area2D/Timer2
@onready var timer_3: Timer = $Area2D/Timer3
@onready var player: CharacterBody2D = $"../Player"
@onready var healthbar: ProgressBar = $Area2D/Healthbar
var drop = preload("res://scenes/drop.tscn")
var speed = 70
var health = 100
var tickable = true
var taking_dmg = false
func _physics_process(delta: float) -> void:
	var direction = (player.position - position).normalized()
	position.x += direction.x * speed * delta
	position.y += direction.y * speed * delta


func _process(delta: float) -> void:
	if tickable && taking_dmg:
		tickable = false
		timer_2.start()
		
		$AnimatedSprite2D.modulate = Color(1, 0, 0)
		health -= 20
		if health <= 0:
			var ddrop = drop.instantiate()
			get_tree().get_root().get_node("Game").add_child(ddrop)

			ddrop.position = position 
			queue_free()
			
		timer_3.start()
	healthbar._set_health(health)
func _on_area_2d_mouse_entered() -> void:
	taking_dmg = true

func _on_area_2d_mouse_exited() -> void:
	taking_dmg = false


func _on_timer_2_timeout() -> void:
	tickable = true


func _on_timer_3_timeout() -> void:
	$AnimatedSprite2D.modulate = Color(1, 1, 1)
