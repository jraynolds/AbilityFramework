extends Resource
class_name EffectResource

enum STACK_BEHAVIOR { Add, Replace, Ignore }
enum END_BEHAVIOR { Revert, None }

@export var title : String
@export var icon : Image
@export var stack_behavior : STACK_BEHAVIOR
@export var durations : Array[DurationResource]
@export var end_on_any_duration : bool = true
@export var end_behavior : END_BEHAVIOR
@export var triggers : Array[TriggerResource]
@export var conditionals : Array[ConditionalResource]
@export var target_finder : TargetFinderResource
@export var stacks : ValueFinderResource

func _init(resource: EffectResource):
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

func register_effects(caster: Entity, ability: Ability, effect: Effect, target: Entity):
	pass

func _get_values(caster: Entity, ability: Ability, effect: Effect, target: Entity):
	pass

func perform(caster: Entity, ability: Ability, effect: Effect, target: Entity):
	pass

func target_select(caster: Entity, ability: Ability, effect: Effect, target: Entity):
	pass

func end():
	pass
