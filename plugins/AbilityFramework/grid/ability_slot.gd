extends PanelContainer
class_name AbilitySlot

@export var ability_rect : AbilityRect

signal signal_ability_slot_hovered(hovered: bool)

func _ready():
	mouse_entered.connect(on_mouse_entered)
	mouse_exited.connect(on_mouse_exited)

# Custom init function so that it doesn't error
func init(cms: Vector2) -> void:
	custom_minimum_size = cms


func on_mouse_entered():
	signal_ability_slot_hovered.emit(true)


func on_mouse_exited():
	signal_ability_slot_hovered.emit(false)
