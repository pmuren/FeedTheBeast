extends RigidBody2D

func _ready():
	$AnimatedSprite2D.play()

func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
