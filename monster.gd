extends Area2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite2D.play('idle')


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_body_entered(body):
	$AnimatedSprite2D.play('chewing')
	$IdleSpriteTimer.start()
	body.queue_free()



func _on_idle_sprite_timer_timeout():
	$AnimatedSprite2D.play('idle')
