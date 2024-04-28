extends Node
class_name Duration

var resource : DurationResource
var duration :
	set(val) :
		duration = val
		signal_duration_update.emit(duration, duration_left)
var duration_left :
	set(val) :
		duration_left = val
		signal_duration_update.emit(duration, duration_left)

signal signal_duration_update(duration_total: float, duration_left: float)

func _init(resource: DurationResource = null, caster: Entity = null, ability: Ability = null, effect: Effect = null, target: Entity = null):
	if !resource:
		return
	self.resource = resource
	duration = resource.duration
	duration_left = resource.duration
	_connect_signals(caster, ability, effect, target)

func _connect_signals(caster: Entity, ability: Ability, effect: Effect, target: Entity):
	match resource.duration_type:
		DurationResource.DURATION_TYPE.Activations:
			effect.signal_effect_activated.connect(func(): duration_left -= 1)
		DurationResource.DURATION_TYPE.BattleTime:
			CombatManager.signal_active_tick.connect(func(delta): duration_left -= delta)
		DurationResource.DURATION_TYPE.ActiveTime:
			GameManager.signal_active_tick.connect(func(delta): duration_left -= delta)
		DurationResource.DURATION_TYPE.TrueTime:
			GameManager.signal_engine_tick.connect(func(delta): duration_left -= delta)

func reset():
	duration_left = duration

func reduce_duration(amount: float):
	duration_left -= amount
