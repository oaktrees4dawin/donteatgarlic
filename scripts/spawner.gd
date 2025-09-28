extends Node2D
@onready var timer: Timer = $Timer

@export var objects = [
	preload("res://scenes/garlic.tscn"),
	preload("res://scenes/chips.tscn"),
	preload("res://scenes/bread.tscn"),
	preload("res://scenes/enemy.tscn"),
	preload("res://scenes/enemy.tscn"),
	preload("res://scenes/enemy.tscn"),
	preload("res://scenes/enemy.tscn"),
	preload("res://scenes/enemy.tscn"),
	preload("res://scenes/enemy.tscn"),

]

var rng = RandomNumberGenerator.new()

var min = 0.0
var max = 3.0

func _ready() -> void:
	print(owner)
	timer.wait_time = rng.randf_range(1, 5)
	timer.start()
	
func spawn_object(object):
	var food = object.instantiate()
	owner.add_child(food)
	food.position = Vector2(position.x + rng.randf_range(200, 500) * ransign(), randf_range(-60, 60))
	print("spawned food!")
	
	
func _on_timer_timeout() -> void:
	for x in range(0, rng.randi_range(floor(min), floor(max))):
		spawn_object(objects[rng.randi() % objects.size()])
		
	min += rng.randi_range(0, 0.5)
	min += rng.randi_range(0, 1)
	timer.wait_time = rng.randf_range(1, 5)
	timer.start()
	
func ransign() -> int:
	var rand = rng.randi_range(0, 1)
	if rand == 0:
		return 1
	return -1
