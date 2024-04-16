extends Resource
class_name EntityResource

var title : String
var abilities : Array[AbilityResource]
var stats : StatsResource

func _init(res: EntityResource):
	title = res.title
	abilities = res.abilities
	stats = res.stats
