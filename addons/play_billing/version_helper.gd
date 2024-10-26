class_name VersionHelper extends Object

static func get_plugin_version() -> String:
	var plugin_config_file := ConfigFile.new()
	var version: String = ""
	
	if plugin_config_file.load("res://addons/play_billing/plugin.cfg") == OK:
		version = plugin_config_file.get_value("plugin", "version")
	else:
		push_error("Failed to load plugin.cfg")
	
	return version
