extends EffectResource
class_name EffectResourceAddTransformLayer

var resource : TransformLayerResource

func perform(caster: Entity, ability: Ability, effect: Effect, target: Entity):
	target.transform_layers_component.add_transform_layer(TransformLayer.new(resource))
