extends Resource
class_name EntityResource

@export var title : String
@export var abilities : Array[AbilityResource]
@export var stats : StatsResource

func _init(res: EntityResource = null):
	if !res:
		return
	title = res.title
	abilities = res.abilities
	stats = res.stats
