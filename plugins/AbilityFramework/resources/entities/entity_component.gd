extends Node
class_name EntityComponent

@export var entity : Entity


func _ready():
	entity.signal_resource_update.connect(on_entity_update)


func on_entity_update():
	_connect_signals()


func _connect_signals():
	pass
