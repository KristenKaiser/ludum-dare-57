extends Node
#class_name  Style

func maximize_container(container: Control) -> void:
	container.anchor_bottom = 1
	container.anchor_left = 0
	container.anchor_right = 1
	container.anchor_top = 0
	container.grow_horizontal = Control.GROW_DIRECTION_END
	container.grow_vertical = Control.GROW_DIRECTION_END
	container.size_flags_vertical = Control.SIZE_EXPAND_FILL
	container.size_flags_horizontal = Control.SIZE_EXPAND_FILL
