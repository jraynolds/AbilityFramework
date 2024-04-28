extends VBoxContainer
class_name AbilityContainer

@export var initial_ability : AbilityResource
var ability : Ability :
	set(val):
		var prev_ability = ability
		if ability:
			remove_child(ability)
		if val:
			add_child(val)
		ability = val
		ability_rect.ability = val
		info_hover.update_readout(ability)
		hoverable = ability != null
		_connect_to_ability(prev_ability, ability)

@export var ability_slot : AbilitySlot
@export var ability_rect : AbilityRect
#@export var quality_rect : QualityRect
@export var info_hover : AbilityInfoHover
@export var subtitle : Label
var readout : String :
	set(val):
		subtitle.text = val

@export var hoverable : bool
@export var draggable : bool
@export var can_accept_ability : bool
var snapshot : Ability

signal signal_ability_dropped(ability: Ability)
signal signal_ability_taken(ability: Ability)


func _ready():
	_connect_signals()


func _connect_signals():
	ability_slot.signal_ability_slot_hovered.connect(on_slot_hovered)
	set_ability_resource(initial_ability)


func _connect_to_ability(prev_ability: Ability, new_ability: Ability):
	if prev_ability:
		prev_ability.signal_changed.disconnect(_on_ability_changed)
	if new_ability:
		new_ability.signal_changed.connect(_on_ability_changed)


func set_ability_resource(ability_resource: AbilityResource) -> void:
	if ability_resource:
		var new_ability = Ability.new()
		new_ability.init(ability_resource)
		ability = new_ability
	else :
		ability = null


# Custom init function so that it doesn't error
func init(cms: Vector2) -> void:
	custom_minimum_size = cms


# _at_position is not used because it doesn't matter where on the panel
# the item is dropped
func _can_drop_data(_at_position: Vector2, data: Variant) -> bool:
	if !can_accept_ability:
		return false
	if snapshot:
		if snapshot == data.ability:
			return true
		return false
	if ability == null:
		return true
	return false


# _at_position is not used because it doesn't matter where on the panel
# the item is dropped
func _drop_data(_at_position: Vector2, data: Variant) -> void:
	if !data or !data.ability:
		return
	var dropped_ability = data.ability
	get_tree().call_group("ability_container", "remove_ability", dropped_ability)
	ability = dropped_ability
	signal_ability_dropped.emit(dropped_ability)


func on_slot_hovered(hovered: bool):
	if hovered and hoverable:
		info_hover.visible = true
		info_hover.position = get_local_mouse_position() + Vector2(2, 2)
	else :
		info_hover.visible = false
	
	if hovered and !draggable:
		mouse_default_cursor_shape = Control.CURSOR_FORBIDDEN
	elif mouse_default_cursor_shape == Control.CURSOR_FORBIDDEN:
		mouse_default_cursor_shape = 0


func remove_ability(removing_ability: Ability):
	if ability == removing_ability:
		ability = null
		signal_ability_taken.emit(removing_ability)


func snapshot_ability():
	snapshot = ability
	if !ability:
		snapshot = Ability.new()


func clear_snapshot():
	snapshot = null


func _on_ability_changed(new_state: Ability):
	ability = new_state
