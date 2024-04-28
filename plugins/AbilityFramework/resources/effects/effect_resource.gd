extends Resource
class_name EffectResource

@export var title : String
@export var icon : Image
@export var triggers : Array[TriggerResource]
@export var conditionals : Array[ConditionalResource]
@export var target_finder : TargetFinderResource

func _init(resource: EffectResource = null):
	if !resource:
		return
	self.title = resource.title
	self.icon = resource.icon
	self.stack_behavior = resource.stack_behavior
	self.durations = resource.durations
	self.end_on_any_duration = resource.end_on_any_duration
	self.end_behavior = resource.end_behavior
	self.triggers = resource.triggers
	self.conditionals = resource.conditionals
	self.target_finder = resource.target_finder
	self.stacks = resource.stacks

func perform(caster: Entity, ability: Ability, effect: Effect, target: Entity):
	pass

func end(caster: Entity, ability: Ability, effect: Effect, target: Entity):
	pass

func revert(caster: Entity, ability: Ability, effect: Effect, target: Entity):
	pass
