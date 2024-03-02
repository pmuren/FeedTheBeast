extends RigidBody2D

#var is_movable = false

func _ready():
	$AnimatedSprite2D.play()
	#var radish_sprite = $AnimatedSprite2D.frames.get_animation_names()
	#$AnimatedSprite2D.animation = radish_sprite

	#if is_movable:
		## Connect the input event to the script
		#set_process_input(true)
		#
func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
#
#
#func _process(delta):
	## If the node is movable, update its position based on input
	#if is_movable:
		#var movement_speed = 200
		#var input_vector = Vector2(0, 0)
#
		#if Input.is_action_pressed("ui_right"):
			#input_vector.x += 1
		#if Input.is_action_pressed("ui_left"):
			#input_vector.x -= 1
		#if Input.is_action_pressed("ui_down"):
			#input_vector.y += 1
		#if Input.is_action_pressed("ui_up"):
			#input_vector.y -= 1

		# Normalize the vector to ensure consistent movement speed in all directions
		#input_vector = input_vector.normalized()

		# Move the node
		#position += input_vector * movement_speed * delta

#func _on_Area2D_area_entered(area):
	#if area.is_in_group("player"):
		## Handle interaction with the player, e.g., display a message, play a sound, etc.
		#print("Player interacted with the static object.")
