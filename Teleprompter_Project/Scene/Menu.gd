extends VBoxContainer


onready var tester = get_node("Tester")
onready var text_box = get_node("HBoxContainer2/VBoxContainer/TextEdit")

func _ready() -> void:
	get_tree().set_screen_stretch(SceneTree.STRETCH_MODE_2D,SceneTree.STRETCH_ASPECT_IGNORE,Vector2(1024,600),1)
	get_tree().get_root().set_transparent_background(false)
	OS.window_per_pixel_transparency_enabled = false
	
	tester.add_font_override("font", Singleton.font)
	tester.add_color_override("font_color", Singleton.font_color)
	text_box.text = Singleton.user_text
	
	var f_style = get_node("HBoxContainer2/VBoxContainer/HBoxContainer/VBoxContainer2/FontStyle")
	var f_size = get_node("HBoxContainer2/VBoxContainer/HBoxContainer/VBoxContainer2/FontSize")
	var f_color = get_node("HBoxContainer2/VBoxContainer/HBoxContainer/VBoxContainer2/FontColor")
	var o_size = get_node("HBoxContainer2/VBoxContainer/HBoxContainer/VBoxContainer/OutlineSize")
	var o_color = get_node("HBoxContainer2/VBoxContainer/HBoxContainer/VBoxContainer/OutlineColor")
	var moving = get_node("HBoxContainer2/VBoxContainer/HBoxContainer/HBoxContainer/Moving")
	var speed = get_node("HBoxContainer2/VBoxContainer/HBoxContainer/HBoxContainer/Speed")
	var caps = get_node("HBoxContainer2/VBoxContainer/HBoxContainer/HBoxContainer/Capitalized")
	
	f_style.add_item("Bold")
	f_style.add_item("Regular")
	f_style.add_item("Italic")

	f_size.add_item("36")
	f_size.add_item("48")
	f_size.add_item("60")
	f_size.add_item("72")
	
	f_color.add_item("Yellow")
	f_color.add_item("White")
	f_color.add_item("Black")
	f_color.add_item("Red")
	f_color.add_item("Green")
	
	o_color.add_item("Red")
	o_color.add_item("White")
	o_color.add_item("Black")
	o_color.add_item("Yellow")
	o_color.add_item("Green")
	
	o_size.add_item("No Outline")
	o_size.add_item("Outline 1")
	o_size.add_item("Outline 2")
	o_size.add_item("Outline 3")
	
	moving.add_item("Auto Scroll")
	moving.add_item("Up/Down Arrow")
	
	caps.add_item("As Typed")
	caps.add_item("ALL CAPS")
	
	speed.add_item("Normal Speed")
	speed.add_item("Very Slow")
	speed.add_item("Slow")
	speed.add_item("Fast")
	speed.add_item("Very Fast")

	
	

func _on_NextScene_pressed() -> void:
	Singleton.user_text = text_box.text
	print(Singleton.user_text)
	get_tree().change_scene_to(Singleton.teleprompter)


func _on_FontStyle_item_selected(index: int) -> void:
	Singleton.font_style = index
	Singleton.update_font(Singleton.font_size,Singleton.font_color,Singleton.outline_size,Singleton.outline_color,Singleton.font_style,tester)
	pass # Replace with function body.


func _on_FontSize_item_selected(index: int) -> void:
	match index:
		0: Singleton.font_size = 36
		1:Singleton.font_size = 48
		2:Singleton.font_size = 60
		3:Singleton.font_size = 72
	Singleton.update_font(Singleton.font_size,Singleton.font_color,Singleton.outline_size,Singleton.outline_color,Singleton.font_style,tester)

func _on_FontColor_item_selected(index: int) -> void:
	match index: 
		0: Singleton.font_color = Singleton.yellow
		1: Singleton.font_color = Singleton.white
		2: Singleton.font_color = Singleton.black
		3: Singleton.font_color = Singleton.red
		4: Singleton.font_color = Singleton.green
	Singleton.update_font(Singleton.font_size,Singleton.font_color,Singleton.outline_size,Singleton.outline_color,Singleton.font_style,tester)


func _on_OutlineSize_item_selected(index: int) -> void:
	Singleton.outline_size = index
	Singleton.update_font(Singleton.font_size,Singleton.font_color,Singleton.outline_size,Singleton.outline_color,Singleton.font_style,tester)


func _on_OutlineColor_item_selected(index: int) -> void:
	match index: 
		0: Singleton.outline_color = Singleton.red
		1: Singleton.outline_color = Singleton.white
		2: Singleton.outline_color = Singleton.black
		3: Singleton.outline_color = Singleton.yellow
		4: Singleton.outline_color = Singleton.green
	Singleton.update_font(Singleton.font_size,Singleton.font_color,Singleton.outline_size,Singleton.outline_color,Singleton.font_style,tester)


func _on_Moving_item_selected(index: int) -> void:
	match index:
		0: Singleton.movement = true
		1: Singleton.movement = false


func _on_Speed_item_selected(index: int) -> void:
	match index:
		0: Singleton.speed = 100
		1: Singleton.speed = 50
		2: Singleton.speed = 75
		3: Singleton.speed = 125
		4: Singleton.speed = 150
	print(Singleton.speed)



func _on_Capitalized_item_selected(index: int) -> void:
	match index:
		0: Singleton.caps = false
		1: Singleton.caps = true
	tester.uppercase = Singleton.caps

