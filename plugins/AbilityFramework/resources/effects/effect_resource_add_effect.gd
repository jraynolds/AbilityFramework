extends EffectResource
class_name EffectResourceAddEffect

@export var resource : EffectResource

func perform(caster: Entity, ability: Ability, effect: Effect, target: Entity):
	target.effects_component.add_effect(Effect.new(resource, caster, ability, target))
