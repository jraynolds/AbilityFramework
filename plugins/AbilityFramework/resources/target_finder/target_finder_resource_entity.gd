extends TargetFinderResource
class_name TargetFinderResourceEntity

enum ENTITY_TARGET { Caster, Target, Either }
@export var entity_target : ENTITY_TARGET

func get_target(caster: Entity, ability: Ability, effect: Effect, target: Entity):
	match entity_target:
		ENTITY_TARGET.Caster:
			return caster
		ENTITY_TARGET.Target:
			return target
	return null
