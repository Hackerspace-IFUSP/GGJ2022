extends Node

var level_open = 1 setget set_level, get_level


#Arquivo do save, dá para abrir no project settings
# Open project data folder

var config = ConfigFile.new()
const CONFIG_FILE = "user://settings.cfg"

# copiando e colando de outro projeto. Dá para por os outros depois

var settings = {
		"audio":{
			 "MusicVolume": null,
			 "MusicMute": null,
			 "SFXVolume": null},
			
		"video":{
			"FullScreen":null
		},
		
		"levels":{
			"current_level":null
		}
	
	}

var default_settings = {
		"audio":{
			 "MusicVolume": -3,
			 "MusicMute": false,
			 "SFXVolume": -3},
			
		"video":{
			"FullScreen": false
		},
		
		"levels":{
			"current_level":1
		}
	
	}

func _ready():
	load_settings()
	level_open = settings["levels"]["current_level"]
	


#carrega o confg e garante que exista um se n achar	
func load_settings():
	var error = config.load(CONFIG_FILE)
	if error != OK:
		make_default_config()
	for section in settings.keys():
		for key in settings[section]:
			settings[section][key] = config.get_value(section, key, default_settings[section][key])
	save_settings()


#salva o config.
func save_settings():
	for section in settings.keys():
		for key in settings[section]:
			config.set_value(section, key, settings[section][key])
	config.save(CONFIG_FILE)


func make_default_config():
	config.save(CONFIG_FILE)


func set_level(level):
	level_open = clamp(level,1,10)
			
	settings["levels"]["current_level"] = level
	save_settings()

func get_level():
	return level_open

