extends Node
class_name Entity

var resource_base : EntityResource
var resource : EntityResource
var abilities_component : EntityComponentAbilities
var transform_layers_component : EntityComponentTransformLayers
var stats_component : EntityComponentStats
var effects_component : EntityComponentEffects

func _init(res: EntityResource):
	resource_base = res
	resource = EntityResource.new(res)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
