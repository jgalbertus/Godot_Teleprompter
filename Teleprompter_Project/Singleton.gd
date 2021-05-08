extends Node

var red := Color(1,0,0,1)
var yellow := Color(1,1,0,1)
var green := Color(0,1,0,1)
var black := Color(0,0,0,1)
var white := Color(1,1,1,1)

var menu: PackedScene = preload("res://Scene/Menu.tscn")
var teleprompter: PackedScene = preload("res://Scene/Teleprompter.tscn")
var font := DynamicFont.new()
var font_style : int = 0
var font_size: int = 48
var font_color:= yellow
var outline_size :int = 0
var outline_color := red
enum text_position {FULLSCREEN, CENTER, LEFT, RIGHT}

var user_text:= "Replace this text with your own.  \nHit the GO button to launch the prompter.   \nHit Escape to return to this screen.  \nResize the window and place it as needed."

enum style {BOLD, REGULAR, I, BLACK, BLACK_I, BOLD_I, LIGHT, LIGHT_I, MEDIUM, MEDIUM_I, THIN, THIN_I}
var Roboto_Black := preload("res://font/Roboto-Black.ttf")
var Roboto_BlackItalic := preload("res://font/Roboto-BlackItalic.ttf")
var Roboto_Bold := preload("res://font/Roboto-Bold.ttf")
var Roboto_BoldItalic := preload("res://font/Roboto-BoldItalic.ttf")
var Roboto_Light := preload("res://font/Roboto-Light.ttf")
var Roboto_LightItalic := preload("res://font/Roboto-LightItalic.ttf")
var Roboto_Italic := preload("res://font/Roboto-Italic.ttf")
var Roboto_Medium := preload("res://font/Roboto-Medium.ttf")
var Roboto_MediumItalic := preload("res://font/Roboto-MediumItalic.ttf")
var Roboto_Regular := preload("res://font/Roboto-Regular.ttf")
var Roboto_Thin := preload("res://font/Roboto-Thin.ttf")
var Roboto_ThinItalic := preload("res://font/Roboto-ThinItalic.ttf")

var movement:= true
var caps := false
var speed := 100


func _ready() -> void:
	
	OS.set_window_always_on_top(true)
	update_font(font_size, font_color, outline_size, outline_color, 0, Control.new())

func update_font(_size: int, _color: Color, _outline_size: int, _outline_color: Color, _style: int, _control_node: Control) -> void:
	match _style:
		style.BLACK: Singleton.font.font_data = Singleton.Roboto_Black
		style.BLACK_I: Singleton.font.font_data = Singleton.Roboto_BlackItalic
		style.BOLD: Singleton.font.font_data = Singleton.Roboto_Bold
		style.BOLD_I: Singleton.font.font_data = Singleton.Roboto_BoldItalic
		style.I: Singleton.font.font_data = Singleton.Roboto_Italic
		style.LIGHT: Singleton.font.font_data = Singleton.Roboto_Light
		style.LIGHT_I: Singleton.font.font_data = Singleton.Roboto_LightItalic
		style.MEDIUM: Singleton.font.font_data = Singleton.Roboto_Medium
		style.MEDIUM_I: Singleton.font.font_data = Singleton.Roboto_MediumItalic
		style.REGULAR: Singleton.font.font_data = Singleton.Roboto_Regular
		style.THIN: Singleton.font.font_data = Singleton.Roboto_Thin
		style.THIN_I: Singleton.font.font_data = Singleton.Roboto_ThinItalic
	font.size = _size
	font.outline_size = _outline_size
	font.outline_color = _outline_color
	font.use_filter = true
	_control_node.add_font_override("font", font)
	_control_node.add_color_override("font_color", _color)

	
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		get_tree().change_scene_to(menu)
