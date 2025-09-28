extends Area2D

func _on_body_entered(body: Node2D) -> void:
	body.speed = min(100, body.speed + 5)
	body.health -= 15
	
	queue_free()
