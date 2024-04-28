extends EffectResource
class_name EffectResourceEntityStatChange

@export var stat : EntityComponentStats.ENTITY_STAT_TYPE
@export var operation : MathOperationResource
@export var change_amount_additions : Array[ValueFinderResource]

func perform(caster: Entity, ability: Ability, effect: Effect, target: Entity):
	var change_amount_summed = 0.0
	for change_amount_addition in change_amount_additions:
		var change_amount = change_amount_addition.get_value(caster, ability, effect, target)
		change_amount_summed += change_amount
	target.stats_component.change_stat(
		stat, 
		change_amount_summed
	)

