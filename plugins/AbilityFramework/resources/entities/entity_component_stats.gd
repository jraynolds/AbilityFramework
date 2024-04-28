extends EntityComponent
class_name EntityComponentStats

var stats_base : StatsResource
var stats : StatsResource

var max_health : EntityStat
var health : EntityStat
var max_mana : EntityStat
var mana : EntityStat
var attack : EntityStat
var level : EntityStat

enum ENTITY_STAT_TYPE { MaxHealth, Health, MaxMana, Mana, Attack, Level }

signal signal_stat_changed(stat_type: ENTITY_STAT_TYPE, old_val, new_val)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _connect_signals():
	max_health.signal_changed.connect(
		func(old_val, new_val): signal_stat_changed.emit(ENTITY_STAT_TYPE.MaxHealth, old_val, new_val)
	)
	health.signal_changed.connect(
		func(old_val, new_val): signal_stat_changed.emit(ENTITY_STAT_TYPE.Health, old_val, new_val)
	)
	max_mana.signal_changed.connect(
		func(old_val, new_val): signal_stat_changed.emit(ENTITY_STAT_TYPE.MaxMana, old_val, new_val)
	)
	mana.signal_changed.connect(
		func(old_val, new_val): signal_stat_changed.emit(ENTITY_STAT_TYPE.Mana, old_val, new_val)
	)
	attack.signal_changed.connect(
		func(old_val, new_val): signal_stat_changed.emit(ENTITY_STAT_TYPE.Attack, old_val, new_val)
	)
	level.signal_changed.connect(
		func(old_val, new_val): signal_stat_changed.emit(ENTITY_STAT_TYPE.Level, old_val, new_val)
	)

func set_stat(val, stat_type: ENTITY_STAT_TYPE):
	match stat_type:
		ENTITY_STAT_TYPE.MaxHealth:
			max_health = val
		ENTITY_STAT_TYPE.Health:
			health = val
		ENTITY_STAT_TYPE.MaxMana:
			max_mana = val
		ENTITY_STAT_TYPE.Mana:
			mana = val
		ENTITY_STAT_TYPE.Attack:
			attack = val
		ENTITY_STAT_TYPE.Level:
			level = val
