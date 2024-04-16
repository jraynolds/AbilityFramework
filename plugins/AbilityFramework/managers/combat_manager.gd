extends Node

var combat_active : bool

var player : Entity
var enemy : Entity

signal signal_combat_begun()
signal signal_combat_ended()

signal signal_active_tick(delta)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if combat_active:
		signal_active_tick.emit(delta)


func get_opponent(entity: Entity):
	if entity == player:
		return enemy
	elif entity == enemy:
		return player
	return null
