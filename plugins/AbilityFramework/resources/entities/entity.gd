extends Node
class_name Entity

var resource_base : EntityResource
var resource : EntityResource :
	set(val):
		resource = val
		signal_resource_update.emit()
@export var abilities_component : EntityComponentAbilities
@export var transform_layers_component : EntityComponentTransformLayers
@export var stats_component : EntityComponentStats
@export var effects_component : EntityComponentEffects

signal signal_resource_update()

func with_data(res: EntityResource):
	resource_base = res
	resource = EntityResource.new(res)
	return self

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func cast_ability(ability: Ability):
	abilities_component.cast(ability)
