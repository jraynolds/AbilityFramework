extends ConditionalResource
class_name ConditionalResourceHasEffect

@export var effect_resource : EffectResource
@export var entity_finder : TargetFinderResourceEntity

func eval(caster: Entity, ability: Ability, effect: Effect, target: Entity):
	var target_entity = entity_finder.get_target(caster, ability, effect, target)
	return target_entity.effects_component.has_effect(effect_resource)
