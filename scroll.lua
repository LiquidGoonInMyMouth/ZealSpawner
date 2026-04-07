{
	"name": "Hotdog's zeal spawner",
	"description": "Scroll, Spawn, and AIM your Zeals",
	"author": "Hotdog",
	"version": "1.4",
	"keybinds": [
		{
			"keybind_id": "jp_scroll",
			"name": "Cycle Zeal Unit",
			"script_path": "scroll.lua",
			"run_in_menu": true,
			"run_in_game": true,
			"localized": false
		},
		{
			"keybind_id": "jp_spawn",
			"name": "Spawn Selected Zeal",
			"script_path": "spawn.lua",
			"run_in_menu": true,
			"run_in_game": true,
			"localized": false
		}
	],
	"hooks": [
		{
			"hook_id": "lib/setups/gamesetup",
			"script_path": "visuals.lua"
		}
	]
}