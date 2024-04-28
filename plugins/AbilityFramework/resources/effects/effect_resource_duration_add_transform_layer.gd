extends EffectResourceDuration
class_name EffectResourceDurationAddTransformLayer

var resource : TransformLayerResource

#func perform(caster: Entity, ability: Ability, effect: Effect, target: Entity):
	#target.transform_layers_component.add_transform_layer(TransformLayer.new(resource))
