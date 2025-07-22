extends Sprite2D
@export var speed: float = 200.0
@onready var viewport_size: Vector2 = get_viewport_rect().size
@onready var sprite_size: Vector2 = texture.get_size() # Get size of sprite's texture

func _process(delta: float) -> void:
	var velocity: Vector2 = Vector2.ZERO  # Initialize velocity to zero

	# Get input from the player
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1

	# Normalize the velocity to prevent faster diagonal movement
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed

 # Update the sprite's position
	position += velocity * delta
	#position.x = clamp(position.x, 0, viewport_size.x)
	#position.y = clamp(position.y, 0, viewport_size.y)
	
	# Keep player within the screen bounds, accounting for sprite size
	position.x = clamp(position.x, sprite_size.x / 10.0, viewport_size.x - sprite_size.x / 10.0)
	position.y = clamp(position.y, sprite_size.y / 10.0, viewport_size.y - sprite_size.y / 10.0)
