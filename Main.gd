extends Node

@export var radish_scene : PackedScene

signal start_game
#
func _ready():
	new_game()

func new_game():
	get_tree().call_group("radishes", "queue_free")
	$RadishTimer.start()
	emit_signal("start_game")

func _on_RadishTimer_timeout():
	## Create a new instance of the Radish scene.
	var radish = radish_scene.instantiate()
#
	## Choose a random location on Path2D.
	var radish_spawn_location = get_node("RadishPath/RadishSpawnLocation")
	radish_spawn_location.progress = randi()
#
	## Set the radish's direction perpendicular to the path direction.
	#var direction = radish_spawn_location.rotation + PI / 2
#
	## Set the radish's position to a random location.
	radish.position = radish_spawn_location.position
#
	## Add some randomness to the direction.
	#direction += randf_range(-PI / 4, PI / 4)
	#radish.rotation = direction
#
	## Choose the velocity for the radish.
	#var velocity = Vector2(randf_range(150.0, 250.0), 0.0)
	#radish.linear_velocity = velocity.rotated(direction)
#
	## Spawn the radish by adding it to the Main scene.
	add_child(radish)
	
