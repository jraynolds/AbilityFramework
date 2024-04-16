extends ValueFinderResourceEntityStat
class_name ValueFinderResourceEntityStatModified

@export var modifier : ValueFinderResource

func get_value(caster: Entity, ability: Ability, effect: Effect, target: Entity):
	var stat_value = super(caster, ability, effect, target)
	var modifier_value = modifier.get_value(caster, ability, effect, target)
	return stat_value * modifier_value
