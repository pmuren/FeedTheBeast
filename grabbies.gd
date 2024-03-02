extends Area2D

var held: RigidBody2D = null

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
			held.reparent(get_node("/root"))
			held.scale = Vector2(1, 1)
			held.freeze = false
			held.apply_impulse(Vector2(2000 * get_parent().scale.x, 0))
			#held.apply_torque(50000)
			held = null
			position.y += 60
			print("throw it!")
			
	if Input.is_action_just_released("use_grabbies"):
		$CollisionShape2D.disabled = true


func _on_body_entered(body: RigidBody2D):
	if(held == null):
		held = body
		position.y -= 60
		body.set_deferred("freeze", true)
		body.call_deferred("reparent", self)
		body.set_deferred("position", Vector2.ZERO)
		print(body.name)
