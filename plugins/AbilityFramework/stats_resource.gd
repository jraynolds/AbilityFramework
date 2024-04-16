extends Resource
class_name StatsResource

var health : int
var attack : float
var level : float

func _init(res: StatsResource):
	health = res.health
	attack = res.attack
	level = res.level
