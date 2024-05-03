extends Area2D

@onready var canvas_group = $CanvasGroup

func _ready() -> void:
	mouse_entered.connect(_on_mouse_entered)
	mouse_exited.connect(_on_mouse_exited)
	canvas_group.material.set_shader_parameter("line_thickness", 7.0)

func _on_mouse_entered():
	var tween := create_tween()
	tween.tween_method(set_outline_thickness, 7.0, 10.0, 0.08)
	canvas_group.material.set_shader_parameter("line_thickness", 10.0)

func _on_mouse_exited():
	var tween := create_tween()
	tween.tween_method(set_outline_thickness, 10.0, 7.0, 0.08)
	canvas_group.material.set_shader_parameter("line_thickness", 7.0)

func set_outline_thickness(new_thickness: float) -> void:
	canvas_group.material.set_shader_parameter("line_thickness", new_thickness)
