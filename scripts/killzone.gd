extends Area2D


@onready var timer: Timer = $Timer
@export var health = 100 
@onready var player: CharacterBody2D = get_tree().get_root().get_node("Game/Player")
var speed = 100
var canAttack = true

var touching = false

func _on_body_entered(body: Node2D) -> void:
	touching = true


func _on_body_exited(body: Node2D) -> void:
	touching = false

func _physics_process(delta: float) -> void:
	if touching == true && canAttack == true:
		player.health -= 10
		canAttack = false
		timer.start()
	
	var direction = (player.position - position).normalized()
	
func _on_timer_timeout() -> void:
	canAttack = true
