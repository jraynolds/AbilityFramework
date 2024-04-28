extends EntityComponent
class_name EntityComponentTransformLayers

var transform_layers : Array[TransformLayerResource] 

signal signal_transform_layer_added(layer: TransformLayerResource)
signal signal_transform_layer_removed(layer: TransformLayerResource)
signal signal_transform_layer_activated(layer: TransformLayerResource, previous_val: Object, new_val: Object)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func add_transform_layer(layer: TransformLayerResource):
	transform_layers.append(layer)
	signal_transform_layer_added.emit(layer)

func remove_transform_layer(layer: TransformLayerResource):
	transform_layers.erase(layer)
	signal_transform_layer_removed.emit(layer)

func transform(val: Object, stat_type: EntityComponentStats.ENTITY_STAT_TYPE):
	var applicable_layers = transform_layers.filter(func(layer): layer.stat_type == stat_type)
	applicable_layers.sort_custom(func(a, b): return a.priority < b.priority)
	for applicable_layer in applicable_layers:
		val = applicable_layer.transform(val)
	entity.stats_component.set_stat(val, stat_type)
