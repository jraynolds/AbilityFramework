extends Node
class_name Effect

var resource_base : EffectResource
var resource : EffectResource
var caster : Entity
var ability : Ability
var target : Entity
var stacks: float :
	set(val) :
		stacks = val
		if stacks <= 0:
			queue_free()

signal signal_activated
signal signal_destroyed

func _init(res: EffectResource = null, c: Entity = null, a: Ability = null, t: Entity = null):
	if !res:
		return
	resource_base = res
	resource = EffectResource.new(res)
	caster = c
	ability = a
	target = t
	
	_register_effects()

func _register_effects():
	for trigger in resource.triggers:
		trigger.register_to_trigger(
			caster, ability, self, target, perform
		)

func perform():
	resource.perform(caster, ability, self, target)
	signal_activated.emit()

func remove_stack(num_stacks: int = 1):
	stacks -= num_stacks

func _exit_tree():
	resource.end(caster, ability, self, target)
	signal_destroyed.emit()
