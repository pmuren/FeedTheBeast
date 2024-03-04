extends Area2D

signal hit

@export var speed = 400 # How fast the player will move (pixels/sec).
var screen_size # Size of the game window.

var spawn_point : Vector2

func _ready(): 
	screen_size = get_viewport_rect().size
	spawn_point = position

func _process(delta):
	var velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1

	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite2D.play()
	else:
		if(!$AnimatedSprite2D.is_playing()):
			$AnimatedSprite2D.stop()

	position += velocity * delta
	position.x = clamp(position.x, 0, screen_size.x)
	position.y = clamp(position.y, 0, screen_size.y)

	if velocity.x != 0:
		$AnimatedSprite2D.animation = "right"
		scale.x = 1 if velocity.x > 0 else -1

	#elif velocity.y != 0:
		#$AnimatedSprite2D.animation = "up"
		#$AnimatedSprite2D.flip_v = velocity.y > 0


func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false

func _on_body_entered(body):
	emit_signal("hit")
	#$CollisionShape2D.set_deferred("disabled", true)


func _on_rigid_body_2d_body_entered(body):
	emit_signal("hit")


func _on_area_entered(area):
	if area.is_in_group("Hitboxes"):
		print("player got hit by ", area.name, "!")
		position = spawn_point

