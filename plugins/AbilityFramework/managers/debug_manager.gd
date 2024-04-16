extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	_connect_signals()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _connect_signals():
	CombatManager.player.abilities_component.signal_ability_casting.connect(
		func(ability): _on_ability_casting(CombatManager.player, ability)
	)
	CombatManager.player.abilities_component.signal_ability_cast.connect(
		func(ability): _on_ability_cast(CombatManager.player, ability)
	)
	CombatManager.enemy.abilities_component.signal_ability_casting.connect(
		func(ability): _on_ability_casting(CombatManager.enemy, ability)
	)
	CombatManager.enemy.abilities_component.signal_ability_cast.connect(
		func(ability): _on_ability_cast(CombatManager.enemy, ability)
	)

func _on_ability_casting(caster: Entity, ability: Ability):
	print("%s is beginning to cast %s." % [ caster.name, ability.name ])

func _on_ability_cast(caster: Entity, ability: Ability):
	print("%s has finsihed casting %s." % [ caster.name, ability.name ])
