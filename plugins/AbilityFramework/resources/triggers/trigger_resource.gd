extends Resource
class_name TriggerResource

var function : Callable

func register_to_trigger(caster: Entity, ability: Ability, effect: Effect, target: Entity, function: Callable):
	self.function = function

func _trigger_resolve():
	function.call()
