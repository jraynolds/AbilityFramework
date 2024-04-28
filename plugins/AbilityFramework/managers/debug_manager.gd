extends Node

signal signal_loaded()

# Called when the node enters the scene tree for the first time.
func _ready():
	_connect_signals()
	signal_loaded.emit()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _connect_signals():
	CombatManager.signal_player_changed.connect(_connect_to_combatant)
	CombatManager.signal_enemy_changed.connect(_connect_to_combatant)
	CombatManager.signal_combat_begun.connect(func(): print("Combat has begun!"))
	CombatManager.signal_combat_ended.connect(func(): print("Combat has ended!"))

func _connect_to_combatant(prev_combatant: Entity, new_combatant: Entity):
	print("combatant %s loaded." % [ new_combatant.name ])
	new_combatant.abilities_component.signal_ability_casting.connect(
		func(ability): _on_ability_casting(CombatManager.enemy, ability)
	)
	new_combatant.abilities_component.signal_ability_cast.connect(
		func(ability): _on_ability_cast(CombatManager.enemy, ability)
	)

func _on_ability_casting(caster: Entity, ability: Ability):
	print("%s is beginning to cast %s." % [ caster.name, ability.name ])

func _on_ability_cast(caster: Entity, ability: Ability):
	print("%s has finsihed casting %s." % [ caster.name, ability.name ])
