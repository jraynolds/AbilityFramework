extends Resource
class_name DurationResource

enum DURATION_TYPE { Activations, BattleTime, ActiveTime, TrueTime, Infinite }
@export var duration_type : DURATION_TYPE
@export var duration : float
