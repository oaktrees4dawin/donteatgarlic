extends Area2D

func _on_body_entered(body: Node2D) -> void:
	body.speed = min(100, body.speed + 10)
	body.health -= 20
	queue_free()
