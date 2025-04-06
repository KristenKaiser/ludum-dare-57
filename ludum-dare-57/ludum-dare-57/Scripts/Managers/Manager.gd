extends Control

const MAIN = preload("res://ludum-dare-57/Scenes/Main.tscn")


const HOME_MENU = preload("res://ludum-dare-57/Scenes/Home_Menu.tscn")
var home_menu : HomeMenu

const AUDIO_MANAGER = preload("res://ludum-dare-57/Scenes/AudioManager.tscn")
var audio_manager : AudioManager

const OCEAN = preload("res://ludum-dare-57/Scenes/Ocean.tscn")
var ocean : Ocean

const GAME = preload("res://ludum-dare-57/Scenes/Game.tscn")
var game : Node2D

const PLAYER = preload("res://ludum-dare-57/Scenes/player.tscn")
var player: Player

const HUD = preload("res://ludum-dare-57/Scenes/Hud.tscn")
var hud : Hud

const SHOP = preload("res://ludum-dare-57/Scenes/Shop.tscn")
var shop : Shop

const DEAD_MENU = preload("res://ludum-dare-57/Scenes/Dead_Menu.tscn")
var dead_menu

func _ready() -> void:
	Style.maximize_container(self)
	load_home_menu()

func load_home_menu() -> void:
	print("START - Initiallizing Home Menu")
	home_menu = HOME_MENU.instantiate()
	add_child(home_menu)
	print("END - Home Menu Initallized")
	
	print("START - Initiallizing Audio Manager")
	audio_manager = AUDIO_MANAGER.instantiate()
	add_child(audio_manager)
	print("END - Audio Manager Initallized")

	
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
	
	print("START - Initiallizing Hud")
	hud = HUD.instantiate()
	game.add_child(hud)
	print("END - Hud Initallized")
	
	print("START - Initiallizing Shop")
	shop = SHOP.instantiate()
	game.add_child(shop)
	shop.hide()
	print("END - Shop Initallized")

func end_game()->void:
	shop.queue_free()
	hud.queue_free()
	player.queue_free()
	ocean.queue_free()
	game.queue_free()
	
func load_dead_menu()->void:
	print("START - Initiallizing Dead Menu")
	dead_menu = DEAD_MENU.instantiate()
	add_child(dead_menu)
	print("END - Dead Menu Initallized")
