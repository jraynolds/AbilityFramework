extends Node
class_name Ability

var resource_base : AbilityResource
var resource : AbilityResource

signal signal_casting()
signal signal_cast()

func _init(res: AbilityResource):
	resource_base = res
	resource = AbilityResource.new(res)

func perform(caster: Entity, target: Entity):
	signal_casting.emit()
	
	signal_cast.emit()
