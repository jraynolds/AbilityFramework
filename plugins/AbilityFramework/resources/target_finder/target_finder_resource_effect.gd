extends TargetFinderResource
class_name TargetFinderResourceEffect

#var entity_target : TargetEntityFinderResource.ENTITY_TARGET
#var effect_resource : EffectResource
#
#func get_target(caster: Entity, ability: Ability, effect: Effect, target: Entity):
	#match entity_target:
		#TargetEntityFinderResource.ENTITY_TARGET.Caster:
			#return caster.effects_component.find_effect(effect_resource)
		#TargetEntityFinderResource.ENTITY_TARGET.Target:
			#return target.effects_component.find_effect(effect_resource)
	#return null
