extends Control

var margin_x = 50
var margin_y = 50

var wait_to_start := true
var count_down := false
var moving := false
#export var mouse_passthrough = PoolVector2Array([Vector2(100,100),Vector2(110,100),Vector2(110,110),Vector2(100,110)])

onready var label = get_node("VBoxContainer/Label")
onready var end_label = get_node("VBoxContainer/Label2")
onready var label_vbox = get_node("VBoxContainer")
onready var button = get_node("start_button")
onready var menu_button = get_node("MenuButton")
onready var button_timer = get_node("start_button/Timer")
func _init():
	#OS.set_window_per_pixel_transparency(true)
	#OS.set_window_mouse_passthrough(mouse_passthrough)
	pass


func _ready():

	print(Singleton.speed)
	get_tree().get_root().set_transparent_background(true)
	OS.window_per_pixel_transparency_enabled = true
	get_tree().set_screen_stretch(SceneTree.STRETCH_MODE_DISABLED,SceneTree.STRETCH_ASPECT_IGNORE,Vector2(100,100),1)
	get_viewport().connect("size_changed", self, "_on_size_changed")
	#OS.set_window_per_pixel_transparency_enabled(true)
	#OS.window_fullscreen = true
	#OS.window_borderless = true
	#OS.window_resizable = false
	
	button.visible = Singleton.movement
	menu_button.visible = Singleton.movement
	button.text = "Click to Start"
	
	label.text = Singleton.user_text
	label.uppercase = Singleton.caps
	label.add_font_override("font", Singleton.font)
	label.add_color_override("font_color", Singleton.font_color)
	
	place_text()

func place_text() -> void:
	var size = OS.window_size
	size.y -= 2*margin_y
	size.x -= 2*margin_x
	label.rect_min_size = size
	label.rect_size = size
	label.rect_position = Vector2(margin_x, margin_y)
	
func _process(delta: float) -> void:
	if end_label.rect_global_position.y <= 0:
		menu_button.visible = true
		
	if Singleton.movement && wait_to_start:
		pass
	elif Singleton.movement && count_down:
		print (button_timer.get_time_left())
		button.text = str(button_timer.get_time_left())

	elif Singleton.movement && moving:
		label_vbox.rect_position.y -= Singleton.speed * delta

	if Input.is_action_pressed("ui_up"):
		label_vbox.rect_position.y -= Singleton.speed * delta
	if Input.is_action_pressed("ui_down"):
		label_vbox.rect_position.y += Singleton.speed * delta

	
func _on_size_changed()-> void:
	place_text()
	print(OS.window_size)


func _on_Button_pressed() -> void:
	button_timer.start()
	wait_to_start = false
	count_down = true

func _on_Timer_timeout() -> void:
	count_down = false
	moving = true
	button.visible = false
	menu_button.visible = false


func _on_Menu_Button_pressed() -> void:
	get_tree().change_scene_to(Singleton.menu)
	pass # Replace with function body.

