extends Node2D
class_name AbilityInfoHover

signal signal_container_hovered(hovered: bool)

@export var container : Container

@export var icon : TextureRect
@export var title_label : Label
@export var description_label : Label
@export var info_label : Label


func _init(ability: Ability = null):
	if ability:
		update_readout(ability)


# Called when the node enters the scene tree for the first time.
func _ready():
	container.mouse_entered.connect(func(): on_container_hovered(true))
	container.mouse_exited.connect(func(): on_container_hovered(false))


func on_container_hovered(hovered: bool):
	signal_container_hovered.emit(hovered)


func update_readout(ability: Ability):
	icon.set_texture(ability.image)
	title_label.set_text(ability.title)
	description_label.set_text(ability.readout)
	info_label.set_text(get_info_text(ability))


func get_info_text(ability: Ability):
	return "1d6 damage"
