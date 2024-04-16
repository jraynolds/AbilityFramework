extends Node

var is_active : bool

signal signal_active_tick(delta)
signal signal_engine_tick(delta)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	signal_engine_tick.emit(delta)
	if is_active:
		signal_active_tick.emit(delta)
