extends Node
class_name EntityStat

var value :
	set(val) :
		var old_value = value
		value = val
		signal_changed.emit(old_value, value)

signal signal_changed(old_value, new_value)
