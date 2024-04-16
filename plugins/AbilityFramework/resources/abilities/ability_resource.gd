extends Resource
class_name AbilityResource

enum COOLDOWN_TYPE { Global, Individual }

@export var title : String
@export var icon : Image
@export var effects : Array[EffectResource]
@export var cooldown_type : COOLDOWN_TYPE
@export var cooldown_length : ValueFinderResource
@export var conditionals : Array[ConditionalResource]

func _init(resource: AbilityResource):
	self.title = resource.title
	self.icon = resource.icon
	self.effects = resource.effects
	self.cooldown_type = resource.cooldown_type
	self.cooldown_length = resource.cooldown_length
