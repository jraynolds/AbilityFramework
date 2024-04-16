extends EntityComponent
class_name EntityComponentAbilities

var abilities : Array[Ability]
var abilities_cast : Array[Ability]
var active_ability : Ability
var cast_time : float
var cast_time_left : float
var cooldown : float
var cooldown_left : float

signal signal_ability_casting(ability: Ability)
signal signal_ability_cast(ability: Ability)
signal signal_cast_time_update(cast_total: float, cast_left: float)
signal signal_cooldown_update(cooldown_total: float, cooldown_left: float)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func cast_ability(ability: Ability):
	ability.signal_casting.connect(func(): signal_ability_casting.emit(ability))
	ability.signal_cast.connect(func(): signal_ability_cast.emit(ability))
	
	ability.perform(entity, CombatManager.get_opponent(entity))
