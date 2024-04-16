extends Resource
class_name TransformLayerResource

var stat_type : EntityComponentStats.ENTITY_STAT_TYPE
var priority : int

func _init(res: TransformLayerResource):
	stat_type = res.stat_type
	priority = res.priority

func transform(val):
	return val
