extends Resource
class_name StatsResource

@export var health : ValueFinderResource
@export var attack : ValueFinderResource
@export var level : ValueFinderResource
@export var gcd : ValueFinderResource

func _init(res: StatsResource = null):
	if !res:
		return
	health = res.health
	attack = res.attack
	level = res.level
	gcd = res.gcd
