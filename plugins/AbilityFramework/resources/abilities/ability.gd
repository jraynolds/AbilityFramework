extends Node
class_name Ability

var resource_base : AbilityResource
var resource : AbilityResource
var casting : bool :
	set(val) :
		casting = val
		if casting:
			signal_casting.emit()
		else :
			if cast_time_left > 0.0:
				signal_cast_interrupted.emit()
			else :
				_on_cast_finished()
var cast_time_left : float
var effects : Array[Effect]

var is_chained : bool

var caster : Entity
var target : Entity

signal signal_casting()
signal signal_cast_interrupted()
signal signal_setting_effects()
signal signal_cast()
signal signal_changed()

func _init(res: AbilityResource = null):
	if !res:
		return
	resource_base = res
	resource = AbilityResource.new(res)

func _on_combat_tick(delta):
	if casting:
		cast_time_left -= delta
		if cast_time_left <= 0.0:
			casting = false

func perform(caster: Entity, target: Entity):
	cast_time_left = 0.0
	casting = true
	var cast_time = resource.cast_time.get_value(caster, self, null, target)
	if cast_time :
		cast_time_left = cast_time
	#CombatManager.signal_active_tick.connect(_on_combat_tick)

func _on_cast_finished():
	for effect in effects:
		effect.queue_free()
	effects = []
	
	for effect in resource.get_effects(self):
		effects.append(Effect.new(effect, caster, self, target))
	signal_cast.emit()
