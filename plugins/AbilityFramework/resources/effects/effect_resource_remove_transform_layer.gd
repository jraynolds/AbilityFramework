extends EffectResource
class_name EffectResourceRemoveTransformLayer

var resource : TransformLayerResource

func perform(caster: Entity, ability: Ability, effect: Effect, target: Entity):
	target.transform_layers_component.remove_transform_layer(TransformLayerResource.new(resource))
