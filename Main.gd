extends Node

@export var radish_scene : PackedScene
#var score
signal start_game
#
func _ready():
	#randomize()
	new_game()
#
#
#func game_over():
	#$ScoreTimer.stop()
	#$MobTimer.stop()
	#$HUD.show_game_over()
	#$Music.stop()
	#$DeathSound.play()
#
#
func new_game():
	get_tree().call_group("radishes", "queue_free")
	$RadishTimer.start()
	emit_signal("start_game")
	#score = 0
	#$Player.start($StartPosition.position)
	#$StartTimer.start()
	#$HUD.update_score(score)
	#$HUD.show_message("Get Ready")
	#$Music.play()
#
#
func _on_RadishTimer_timeout():
	## Create a new instance of the Mob scene.
	var radish = radish_scene.instantiate()
#
	## Choose a random location on Path2D.
	var radish_spawn_location = get_node("RadishPath/RadishSpawnLocation")
	radish_spawn_location.progress = randi()
#
	## Set the mob's direction perpendicular to the path direction.
	var direction = radish_spawn_location.rotation + PI / 2
#
	## Set the mob's position to a random location.
	radish.position = radish_spawn_location.position
#
	## Add some randomness to the direction.
	direction += randf_range(-PI / 4, PI / 4)
	radish.rotation = direction
#
	## Choose the velocity for the mob.
	#var velocity = Vector2(randf_range(150.0, 250.0), 0.0)
	#radish.linear_velocity = velocity.rotated(direction)
#
	## Spawn the mob by adding it to the Main scene.
	add_child(radish)
#
#
#func _on_ScoreTimer_timeout():
	#score += 1
	#$HUD.update_score(score)
#func _ready():
	#var new_node = interactive_node_scene.instantiate()
	#get_node("CanvasGroup").add_child(new_node)


#func _on_StartTimer_timeout():
	#$MobTimer.start()
	##$ScoreTimer.start()
	
#
#var interactive_node_scene : PackedScene = preload("res://radish.tscn")
#
#func _on_Timer_timeout():
	#var new_node = interactive_node_scene.instantiate()
	#var canvas_group : CanvasGroup
	## Set the position for the new node within the CanvasGroup
	#new_node.rect_position.x = randf_range(0, canvas_group.rect_size.x)
	#new_node.rect_position.y = randf_range(0, canvas_group.rect_size.y)
	#
	## Add the new node to the CanvasGroup
	#canvas_group.add_child(new_node)

#
#func _on_radish_timer_timeout():
	#pass # Replace with function body.
