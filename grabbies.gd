extends Area2D

var held: RigidBody2D = null
var liftDistance = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	$CollisionShape2D.disabled = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("use_grabbies"):
		if held == null:
			$CollisionShape2D.disabled = false
		else:
			$CollisionShape2D.disabled = true
			get_parent().get_node("AnimatedSprite2D").play("throw")
			print(get_parent().get_node("AnimatedSprite2D"))
			var saved_player_scale = get_parent().scale
			held.reparent(get_node("/root"))
			#held.rotation = 0
			#if !held.is_in_group("Creatures"):
			held.freeze = false
			held.lock_rotation = false
			held.apply_impulse(Vector2(2000 * get_parent().scale.x, 0))
			held.apply_torque(500000)
			held = null
			position.y += liftDistance
			
	if Input.is_action_just_released("use_grabbies"):
		$CollisionShape2D.disabled = true

func _on_body_entered(body: RigidBody2D):
	if(held == null and body.is_in_group("Grabbable")):
		held = body
		get_parent().get_node("AnimatedSprite2D").play("grab")
		position.y -= liftDistance
		body.set_deferred("freeze", true)
		body.call_deferred("reparent", self)
		body.set_deferred("position", Vector2.ZERO)
		print(body.name)
