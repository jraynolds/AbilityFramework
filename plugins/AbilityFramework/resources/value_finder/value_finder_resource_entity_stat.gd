extends ValueFinderResource
class_name ValueFinderResourceEntityStat

@export var stat : EntityComponentStats.ENTITY_STAT_TYPE

func get_value(caster: Entity, ability: Ability, effect: Effect, target: Entity):
	var entity_target = target_finder.get_target(caster, ability, effect, target)
	assert(entity_target is Entity)
	return entity_target.stat_component.get_stat(stat)
