extends EntityComponent
class_name EntityComponentEffects

var effects : Array[Effect]

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func add_effect(effect: Effect):
	effects.append(effect)


func remove_effect(effect: EffectResource):
	effects.erase(effects.filter(func(e): e.resource_base == effect).front())

func remove_stack(effect: EffectResource):
	var matching_effect = effects.filter(func(e): e.resource_base == effect).front()
	matching_effect.remove_stack()

func has_effect(effect: EffectResource):
	return effects.find(func(e): e.resource_base == effect)
