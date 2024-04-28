extends EffectResource
class_name EffectResourceDuration

enum STACK_BEHAVIOR { Add, Replace, Ignore }
enum END_BEHAVIOR { Revert, RemoveSelf, RemoveStack, None }

@export var stack_behavior : STACK_BEHAVIOR
@export var durations : Array[DurationResource]
@export var end_on_any_duration : bool = true
@export var end_behavior : END_BEHAVIOR
@export var stacks : ValueFinderResource


func _init(resource: EffectResource):
	super(resource)
	self.stack_behavior = resource.stack_behavior
	self.durations = resource.durations
	self.end_on_any_duration = resource.end_on_any_duration
	self.end_behavior = resource.end_behavior
	self.stacks = resource.stacks

func end(caster: Entity, ability: Ability, effect: Effect, target: Entity):
	match end_behavior:
		END_BEHAVIOR.Revert:
			revert(caster, ability, effect, target)
		END_BEHAVIOR.RemoveSelf:
			target_finder.get_target(caster, ability, effect, target).effects_component.remove_effect_resource(self)
		END_BEHAVIOR.RemoveStack:
			target_finder.get_target(caster, ability, effect, target).effects_component.remove_effect_resource_stack(self)

func revert(caster: Entity, ability: Ability, effect: Effect, target: Entity):
	pass
