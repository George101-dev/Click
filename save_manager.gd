extends Node

const save_file_name: String = "user://save_clickergame.json"
const default_dictionary: Dictionary = {"coins": 0.00, "upgradeLevelClicks": 0, "upgradeLevelCps": 0, "upgradeLevelCrit": 0, "upgradeCostClicks": 50.00, "upgradeCostCps": 100.00, "upgradeCostCrit": 150.00, "clicks": 0, "n": 1.00, "critChance": 2.5, "critMultiplier": 2.00, "autoGenerates": 0.00, "can_Click": true}

func save_game(data: Dictionary) -> void:
	var save_file: FileAccess = FileAccess.open(save_file_name, FileAccess.WRITE)
	var string_data: String = JSON.stringify(data)
	save_file.store_line(string_data)
	save_file.close()

func load_game() -> Dictionary:
	if FileAccess.file_exists(save_file_name):
		var save_file: FileAccess = FileAccess.open(save_file_name, FileAccess.READ)
		if save_file == null:
			push_error("Error reading file!")
			return default_dictionary
			
		var json = JSON.new()
		
		var string_data: String = save_file.get_line()
		if json.parse(string_data) == OK:
			var data: Dictionary = json.get_data()
			save_file.close()
			return data
		push_error("Corrupted data!")
	return default_dictionary

func reset_data() -> void:
	save_game(default_dictionary)
