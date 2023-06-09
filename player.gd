extends CharacterBody2D

const speed = 100
var direction : Vector2

func _physics_process(delta):
	velocity = direction * speed
	move_and_slide()

func _unhandled_input(_event:InputEvent):
	direction.x = Input.get_axis("ui_left","ui_right")
	direction.y = Input.get_axis("ui_up","ui_down")
	direction = direction.normalized()
	
