extends TargetFinderResource
class_name TargetFinderResourceAbility

@export var entity_target : TargetFinderResourceEntity.ENTITY_TARGET
@export var ability_resource : AbilityResource

func get_target(caster: Entity, ability: Ability, effect: Effect, target: Entity):
	match entity_target:
		TargetFinderResourceEntity.ENTITY_TARGET.Caster:
			return caster.ability_component.find_ability(ability_resource)
		TargetFinderResourceEntity.ENTITY_TARGET.Target:
			return target.ability_component.find_ability(ability_resource)
		TargetFinderResourceEntity.ENTITY_TARGET.Either:
			if caster.ability_component.find_ability(ability_resource):
				return caster.ability_component.find_ability(ability_resource)
			else :
				return target.ability_component.find_ability(ability_resource)
	return null
