extends CharacterBody2D

@export var speed = 100
@export var health = 100
var input_direction = Vector2(0, 0)
@onready var timer: Timer = $Timer

@onready var healthbar: ProgressBar = $"../CanvasLayer/Healthbar"
@onready var speedbar: ProgressBar = $"../CanvasLayer/Speedbar"

func get_input():
	input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down").normalized()
	velocity = input_direction * speed
	if input_direction.x == 0 && input_direction.y == 0:
		$AnimatedSprite2D.animation = "idle"
	else:
		$AnimatedSprite2D.animation = "walk"
		if input_direction.x < 0:
			$AnimatedSprite2D.flip_h = true
		elif input_direction.x > 0:
			$AnimatedSprite2D.flip_h = false
			
func _physics_process(delta):
	get_input()
	move_and_slide()
	
	if health <= 0:
		get_tree().change_scene_to_file("res://scenes/gameover.tscn")		
	if speed <= 0:
		get_tree().change_scene_to_file("res://scenes/gameover.tscn")		
	healthbar._set_health(health)
	speedbar._set_health(speed)
		
func _on_timer_timeout():
	speed -= 3
	
