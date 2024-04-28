extends GridContainer
class_name AbilityGrid

@export var ability_containers : Array[AbilityContainer]

signal signal_ability_pressed(ability: Ability)
signal signal_empty_container_pressed

# Called when the node enters the scene tree for the first time.
func _ready():
	_connect_signals()


func _connect_signals():
	for ability_container in ability_containers:
		ability_container.signal_container_pressed.connect(on_ability_container_pressed)


# Called every frame. 'delta' is the elapsed timesince the previous frame.
func _process(delta):
	pass


func on_ability_cast(ability: Ability, caster: Entity, target: Entity):
	for ability_container in ability_containers:
		ability_container.on_ability_cast(ability, caster, target)


func on_global_cooldown_remaining_changed(cooldown_remaining: float, cooldown_total: float):
	for ability_container in ability_containers:
		ability_container.on_global_cooldown_remaining_changed(cooldown_remaining, cooldown_total)
#	print(str(cooldown_remaining) + \" / \" + str(cooldown_total))


func on_ability_container_pressed(container: AbilityContainer):
	if !CombatManager.combat_active:
		return
	if container.ability and container.ability.resource:
		signal_ability_pressed.emit(container.ability)
	else :
		signal_empty_container_pressed.emit()
