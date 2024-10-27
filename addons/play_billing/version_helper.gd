extends Object


## Provides helper functions related to version management.
## 
## The VersionHelper class contains utility methods to retrieve
## version details of the Godot Play Billing plugin by reading from
## the plugin configuration file.
class_name VersionHelper


## Retrieves the version number of the Play Billing plugin.[br]
##
## This method reads the version from the `plugin.cfg` file located
## in the `addons/play_billing` directory. If the file cannot be loaded,
## it logs an error message.[br][br]
##
## Returns the plugin version as a [String]. If the file fails to load, an empty string is returned.[br]
static func get_plugin_version() -> String:
	var plugin_config_file := ConfigFile.new()
	var version: String = ""
	
	if plugin_config_file.load("res://addons/play_billing/plugin.cfg") == OK:
		version = plugin_config_file.get_value("plugin", "version")
	else:
		push_error("Failed to load plugin.cfg")
	
	return version
