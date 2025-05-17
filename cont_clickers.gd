extends VBoxContainer

func _on_button_up1_pressed() -> void:
	print("+1 button pressed")
	get_parent().inc_value(1)

func _on_button_up5_pressed() -> void:
	print("+5 button pressed")
	get_parent().inc_value(5)

func _on_button_up10_pressed() -> void:
	print("+10 button pressed")
	get_parent().inc_value(10)
