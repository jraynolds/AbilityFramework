extends ConditionalResource
class_name ConditionalResourceValuesComparison

enum MATH_COMPARATOR { GreaterThan, LessThan, Equal, NotEqual }
var comparator : MATH_COMPARATOR
var value_1 : ValueFinderResource
var value_2 : ValueFinderResource

func eval(caster: Entity, ability: Ability, effect: Effect, target: Entity):
	var v1 = value_1.get_value(caster, ability, effect, target)
	var v2 = value_2.get_value(caster, ability, effect, target)
	match comparator:
		MATH_COMPARATOR.GreaterThan:
			return v1 > v2
		MATH_COMPARATOR.LessThan:
			return v1 < v2
		MATH_COMPARATOR.Equal:
			return v1 == v2
		MATH_COMPARATOR.NotEqual:
			return v1 != v2
	return false
