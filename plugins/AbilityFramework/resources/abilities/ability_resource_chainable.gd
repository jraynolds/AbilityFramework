extends AbilityResource
class_name AbilityResourceChainable

enum CHAINED_BEHAVIOR { OnlyChained, BothChainedAndUnchained }

@export var chaining_abilities : Array[AbilityResource]
@export var chained_effects : Array[EffectResource]
@export var chained_behavior : CHAINED_BEHAVIOR

func get_effects(ability: Ability):
	if ability.is_chained:
		match chained_behavior:
			CHAINED_BEHAVIOR.OnlyChained:
				return chained_effects
			CHAINED_BEHAVIOR.BothChainedAndUnchained:
				var combined_effects = effects
				combined_effects.append_array(chained_effects)
				return combined_effects
	else :
		return effects
