extends TextureRect
class_name AbilityRect

@export var container : AbilityContainer
#@export var quality_rect : QualityRect

var ability : Ability :
	set(val):
		texture = val.image if val else null
		visible = val != null
		#quality_rect.quality = val.quality if val else 0
		ability = val

# Custom init function so that it doesn't error
#func init(new_ability: Ability) -> void:
	#expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	#stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED


# _at_position is not used because it doesn't matter where we click on
# the inventory item.
func _get_drag_data(_at_position: Vector2) -> Variant:
	if !container.draggable:
		return null
	set_modulate(Color(1, 1, 1, .5))
	set_drag_preview(make_drag_preview())
	return self


# displays item and to show it being dragged, but also can display data.
func make_drag_preview() -> TextureRect:
	var n = Node2D.new()
	var t := TextureRect.new()
	
	t.texture = texture
	t.expand_mode = TextureRect.EXPAND_IGNORE_SIZE
	t.stretch_mode = TextureRect.STRETCH_KEEP_ASPECT_CENTERED
	t.custom_minimum_size = size
	t.z_index = 100
	return t


func _notification(notification_type): 
	match notification_type:
		NOTIFICATION_DRAG_END: 
			_drag_ended()


func _drag_ended():
	set_modulate(Color(1, 1, 1, 1))


func _process(_delta):
	pass
