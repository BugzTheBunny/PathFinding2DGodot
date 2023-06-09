extends CharacterBody2D

const speed = 50

@export var player: CharacterBody2D
@onready var navigation_agent = $NavigationAgent2D as NavigationAgent2D

func _ready():
	$Timer.timeout.connect(on_timer_timeout)

func _physics_process(_delta:float) -> void:
	# Making the enemy go by navigator destination
	var direction = to_local(navigation_agent.get_next_path_position()).normalized()
	velocity = direction * speed
	move_and_slide()

func set_direction() -> void:
	# Setting the navigators where is the player
	navigation_agent.target_position = player.global_position
	
	
func on_timer_timeout():
	# On timeout, will create a new path.
	set_direction()
