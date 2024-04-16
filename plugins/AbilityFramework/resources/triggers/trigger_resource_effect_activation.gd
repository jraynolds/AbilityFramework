extends TriggerResource
class_name TriggerResourceEffectActivation

var effect_finder : TargetFinderResourceEffect

func register_to_trigger(caster: Entity, ability: Ability, effect: Effect, target: Entity, function: Callable):
	super(caster, ability, effect, target, function)
	var activated_effect = effect_finder.get_target(caster, ability, effect, target)
	assert(activated_effect is Effect)
	activated_effect.signal_effect_activated.connect(_trigger_resolve())
