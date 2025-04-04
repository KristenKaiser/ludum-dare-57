extends Control

const MAIN = preload("res://ludum-dare-57/Scenes/Main.tscn")
var main : Node

const HOME_MENU = preload("res://ludum-dare-57/Scenes/Home_Menu.tscn")
var home_menu : HomeMenu



func _ready() -> void:
	Style.maximize_container(self)
	load_home_menu()

func load_home_menu() -> void:
	print("START - Initiallizing Home Menu")
	home_menu = HOME_MENU.instantiate()
	add_child(home_menu)
	print("END - Home Menu Initallized")
	
func start_game() -> void:
	print("Start Game")
