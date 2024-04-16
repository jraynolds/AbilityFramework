extends EffectResource
class_name EffectAbilityStatChangeResource

#var stat : ABILITY_STAT_TYPE
#var operation : MathOperationResource
#
#func perform(caster: Entity, target: Entity):
	#var ability_target = target_select(caster, target)
	#ability_target.change_stat(
		#stat,
		#operation.eval(ability_target.get_stat(stat), _get_values(caster, target))
	#)
