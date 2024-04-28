extends EntityComponent
class_name EntityComponentEffects

var effects : Array[Effect]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func add_effect(effect: Effect):
	effects.append(effect)

func remove_effect_resource(effect: EffectResource):
	effects.erase(effects.filter(func(e): e.resource_base == effect).front())

func remove_effect_resource_stack(effect: EffectResource, stacks: int=1):
	var matching_effect = effects.filter(func(e): e.resource_base == effect).front()
	matching_effect.remove_stack(stacks)

func has_effect_resource(effect: EffectResource):
	return effects.find(func(e): e.resource_base == effect)
