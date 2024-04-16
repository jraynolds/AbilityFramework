extends Node
class_name Effect

var resource_base : EffectResource
var resource : EffectResource
var caster : Entity
var ability : Ability
var target : Entity
var stacks: float

signal signal_effect_activated

func _init(res: EffectResource, caster: Entity, ability: Ability, target: Entity):
	resource_base = res
	resource = EffectResource.new(res)
	self.caster = caster
	self.ability = ability
	self.target = target

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _register_effects():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func perform():
	pass

func end():
	pass
