extends RigidBody2D

var wandering_radius = 200
var origin_pos : Vector2
var target_pos : Vector2
var speed = 100

var rest_duration = 1
var rest_timer = 0

var tumble_duration = 8
var tumble_timer = 0

var state = "wander"

# Called when the node enters the scene tree for the first time.
func _ready():
	origin_pos = position
	target_pos = random_pos_in_range(origin_pos, wandering_radius)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if(state == "wander"):
		if(position.distance_to(target_pos) < 2):
			if(rest_timer < rest_duration):
				rest_timer += delta
			else:
				origin_pos = target_pos
				target_pos = random_pos_in_range(origin_pos, wandering_radius)
				rest_timer = 0
				rest_duration = 1 + 0.5 * (randi() % 4)
		else:
			var heading = (target_pos - position).normalized()
			var next_step = heading * speed * delta

			position += next_step
	elif(state == "tumble"):
		if(tumble_timer > tumble_duration):
			recover()
			tumble_timer = 0
		else:
			tumble_timer += delta

func random_pos_in_range (origin: Vector2, radius: int) -> Vector2:
	var random_x = randi() % (radius*2) - radius
	var random_y = randi() % (radius*2) - radius
	return origin + Vector2(random_x, random_y)
	

func _on_hurtbox_body_entered(body):
	print("body ", body.name, " hit creature")

func _on_hurtbox_area_entered(area):
	state = "tumble"
	$AnimatedSprite2D.flip_v = true
	$Hitbox.set_deferred("monitorable", false)
	set_deferred("freeze", false)
	add_to_group("Grabbable")
	print("area ", area.name, " hit creature")
	
func recover():
	print("RECOVERED!!!!")
	state="wander"
	$AnimatedSprite2D.flip_v = false
	$Hitbox.monitorable = true
	reparent(get_node("/root"))
	freeze = true
	rotation = 0
	scale = Vector2(1, 1)
	remove_from_group("Grabbable")
	origin_pos = position
	
