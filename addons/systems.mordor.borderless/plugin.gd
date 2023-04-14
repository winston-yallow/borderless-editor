@tool
extends EditorPlugin


var root: Window


func _enter_tree() -> void:
	var interface := get_editor_interface()
	var base := interface.get_base_control()
	root = base.get_viewport()
	root.size_changed.connect(_update_border)
	_update_border()


func _exit_tree() -> void:
	root.borderless = false
	root.size_changed.disconnect(_update_border)


func _update_border() -> void:
	if root.mode == Window.MODE_MAXIMIZED:
		root.borderless = true
	else:
		root.borderless = false
