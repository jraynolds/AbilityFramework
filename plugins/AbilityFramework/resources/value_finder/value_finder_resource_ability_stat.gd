extends ValueFinderResource
class_name ValueFinderResourceAbilityStat

#var stat : Ability.ABILITY_STAT

#func get_value(caster: Entity, ability: Ability, effect: Effect, target: Entity):
	#var ability_target = target_finder.get_target()
	#assert(ability_target is Ability)
	#return ability_target.get_stat(stat)
