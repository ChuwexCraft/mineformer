extends CharacterBody2D
var can_jump : bool = true
var stun : bool = false
const SPEED = 130.0
const JUMP_VELOCITY = -300.0
@onready var coyote_timer : Timer = $CoyoteTimer
@onready var jump_buffer_timer: Timer = $JumpBufferTimer
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D


func jump():
    velocity.y = JUMP_VELOCITY
    animated_sprite_2d.play("jump")
    can_jump = false
    
func _physics_process(delta: float) -> void :
    
    if can_jump == false and is_on_floor():
        can_jump = true
    if is_on_floor() and velocity.x == 0:
        animated_sprite_2d.play("idle")
    if not is_on_floor():
        animated_sprite_2d.play("jump")
        velocity += get_gravity() * delta

    if !stun and Input.is_action_just_pressed("jump"):
        jump_buffer_timer.start()
    if !stun and !jump_buffer_timer.is_stopped() and can_jump:
        jump()

    if is_on_floor() and can_jump and coyote_timer.is_stopped():
        coyote_timer.start()


    var direction: = Input.get_axis("left", "right")
    if !stun and direction > 0:
        animated_sprite_2d.flip_h = false
    elif !stun and direction < 0:
        animated_sprite_2d.flip_h = true

    if !stun and direction:
        if is_on_floor():
            animated_sprite_2d.play("walk")
        velocity.x = direction * SPEED

    else:
        velocity.x = move_toward(velocity.x, 0, SPEED)

    move_and_slide()


func _on_dragon_egg_end_body_entered(body: Node2D) -> void:
    stun = true


func _on_coyote_timer_timeout() -> void:
    can_jump = false
