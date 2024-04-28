extends Node

var combat_active : bool

var player : Entity :
	set(val): 
		var old_player = player
		player = val
		signal_player_changed.emit(old_player, player)
var enemy : Entity :
	set(val): 
		var old_enemy = enemy
		enemy = val
		signal_enemy_changed.emit(old_enemy, enemy)

signal signal_loaded()
signal signal_player_changed(prev_player: Entity, new_player: Entity)
signal signal_enemy_changed(prev_enemy: Entity, new_enemy: Entity)
signal signal_combat_begun()
signal signal_combat_ended()
signal signal_active_tick(delta)

# Called when the node enters the scene tree for the first time.
func _ready():
	signal_loaded.emit()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if combat_active:
		signal_active_tick.emit(delta)


func begin_combat(friendly: Entity, opponent: Entity):
	print("beginning the combat..."	)
	print(friendly)
	print(opponent)
	player = friendly
	enemy = opponent
	signal_combat_begun.emit()


func get_opposite(entity: Entity):
	if entity == player:
		return enemy
	elif entity == enemy:
		return player
	return null
