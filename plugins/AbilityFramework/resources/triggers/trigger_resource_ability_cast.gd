extends TriggerResource
class_name TriggerResourceAbilityCast

@export var ability_finder : TargetFinderResourceAbility

func register_to_trigger(caster: Entity, ability: Ability, effect: Effect, target: Entity, function: Callable):
	super(caster, ability, effect, target, function)
	var activated_ability = ability_finder.get_target(caster, ability, effect, target)
	assert(activated_ability is Ability)
	activated_ability.signal_cast.connect(_trigger_resolve())
