extends AbilityResource
class_name AbilityResourceChainable

enum CHAINED_BEHAVIOR { OnlyChained, BothChainAndUnchained }

var is_chained : bool
@export var chaining_abilities : Array[AbilityResource]
@export var chained_effects : Array[EffectResource]
@export var chained_behavior : CHAINED_BEHAVIOR

