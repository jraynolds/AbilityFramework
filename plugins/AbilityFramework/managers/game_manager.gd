extends Node

var is_active : bool

signal signal_game_begun()
signal signal_game_loaded()
signal signal_active_tick(delta)
signal signal_engine_tick(delta)
signal signal_game_ended()

@export var entity_scene : PackedScene

@export var player_resource : EntityResource
var player : Entity
@export var enemy_resource : EntityResource
var enemy : Entity

var _waiting_on_initial_load : bool
var _combat_loaded : bool
var _debug_loaded : bool

# Called when the node enters the scene tree for the first time.
func _ready():
	_connect_signals()
	_waiting_on_initial_load = true
	is_active = true
	
	player = entity_scene.instantiate().with_data(player_resource)
	add_child(player)
	enemy = entity_scene.instantiate().with_data(enemy_resource)
	add_child(enemy)
	enemy.name = "Enemy"


func _connect_signals():
	CombatManager.signal_loaded.connect(func(): _combat_loaded = true)
	DebugManager.signal_loaded.connect(func(): _debug_loaded = true)
	pass

func _on_initial_load_complete():
	_waiting_on_initial_load = false
	CombatManager.begin_combat(player, enemy)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if _waiting_on_initial_load:
		if _combat_loaded and _debug_loaded:
			_on_initial_load_complete()
	signal_engine_tick.emit(delta)
	if is_active:
		signal_active_tick.emit(delta)
