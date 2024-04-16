extends EffectResource
class_name EffectResourceRemoveEffect

enum REMOVAL_BEHAVIOR { Stack, EntireEffect }

@export var resource : EffectResource
@export var removal_behavior : REMOVAL_BEHAVIOR

func perform(caster: Entity, ability: Ability, effect: Effect, target: Entity):
	match removal_behavior:
		REMOVAL_BEHAVIOR.Stack:
			target.effects_component.remove_stack(resource)
		REMOVAL_BEHAVIOR.EntireEffect:
			target.effects_component.remove_effect(resource)
