extends ValueFinderResource
class_name ValueFinderResourceGiven

@export var value : float

func get_value(caster: Entity, ability: Ability, effect: Effect, target: Entity):
	return value
