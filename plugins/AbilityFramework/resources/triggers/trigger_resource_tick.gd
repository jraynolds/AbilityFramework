extends TriggerResource
class_name TriggerTickResource

enum TICK_TYPE { CombatTick, ActiveTick, EngineTick }
var tick_type : TICK_TYPE
var duration_resource : DurationResource
var duration : Duration

func register_to_trigger(caster: Entity, ability: Ability, effect: Effect, target: Entity, function: Callable):
	super(caster, ability, effect, target, function)
	duration = Duration.new(duration_resource, caster, ability, effect, target)
	duration.signal_duration_update.connect(
		func(duration_total: float, duration_left: float): 
			_on_duration_update(duration_total, duration_left, function)
	)
	match tick_type:
		TICK_TYPE.CombatTick:
			CombatManager.signal_combat_tick.connect(_on_tick)
		TICK_TYPE.ActiveTick:
			GameManager.signal_active_tick.connect(_on_tick)
		TICK_TYPE.EngineTick:
			GameManager.signal_active_tick.connect(_on_tick)

func _on_duration_update(duration_total: float, duration_left: float, function: Callable):
	if duration_left <= 0.0:
		_trigger_resolve()
		duration.reset()

func _on_tick(delta):
	duration.reduce_duration(delta)
