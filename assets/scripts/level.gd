extends Node2D
@export var enemy : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GLOBAL.score = 0
	GLOBAL.credits = 1
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta) -> void:
	parallax_bg(delta)
	
	
	$PathSpawn/PathFollow.set_progress($PathSpawn/PathFollow.get_progress() + 10 * delta)


func parallax_bg(delta_time) -> void:
	get_node("Background/Back").scroll_base_offset -= Vector2(1,0) * 8 * delta_time	
	$Background/Starts.scroll_base_offset -= Vector2(1,0) * 16 * delta_time	
	$Background/Planet_1.scroll_base_offset -= Vector2(1,0) * 24 * delta_time	
	$Background/Planet_2.scroll_base_offset -= Vector2(1,0) * 24 * delta_time	

func _on_timer_timeout():
	var enemy_instance=enemy.instantiate()
	var axis_y=randf_range(16.0,144.0) 
	print(axis_y)
	enemy_instance.global_position= Vector2(272,axis_y)#$PathSpawn/PathFollow.global_position 
	add_child(enemy_instance)
