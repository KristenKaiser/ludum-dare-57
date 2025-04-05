extends Control

const MAIN = preload("res://ludum-dare-57/Scenes/Main.tscn")


const HOME_MENU = preload("res://ludum-dare-57/Scenes/Home_Menu.tscn")
var home_menu : HomeMenu

const OCEAN = preload("res://ludum-dare-57/Scenes/Ocean.tscn")
var ocean : Ocean

const GAME = preload("res://ludum-dare-57/Scenes/Game.tscn")
var game : Node2D

const PLAYER = preload("res://ludum-dare-57/Scenes/player.tscn")
var player: Player

func _ready() -> void:
	Style.maximize_container(self)
	load_home_menu()

func load_home_menu() -> void:
	print("START - Initiallizing Home Menu")
	home_menu = HOME_MENU.instantiate()
	add_child(home_menu)
	print("END - Home Menu Initallized")
	
func start_game() -> void:
	home_menu.hide()
	print("START - Initiallizing Game")
	game = GAME.instantiate()
	add_child(game)
	print("END - Game Initallized")
	
	print("START - Initiallizing Ocean")
	ocean = OCEAN.instantiate()
	game.add_child(ocean)
	print("END - Ocean Initallized")
	
	print("START - Initiallizing Ocean")
	player = PLAYER.instantiate()
	game.add_child(player)
	print("END - Ocean Initallized")
	
