## This is the main plugin class for integrating Google Play Billing into Godot.

## It extends the EditorPlugin class and provides functionality for exporting
## the PlayBilling plugin on the Android platform.
@tool
class_name PlayBillingPlugin extends EditorPlugin


var _export_plugin: PlayBillingExportPlugin

## Stores the version of the PlayBilling plugin retrieved from VersionHelper
var plugin_version: String = VersionHelper.get_plugin_version()


class PlayBillingExportPlugin extends EditorExportPlugin:
	
	func _get_name() -> String:
		return "PlayBilling"
	
	
	func _supports_platform(platform: EditorExportPlatform) -> bool:
		if platform is EditorExportPlatformAndroid:
			return true
		return false
	
	
	func _get_android_libraries(
		platform: EditorExportPlatform, debug: bool) -> PackedStringArray:
		if debug:
			return PackedStringArray(
				["res://addons/play_billing/aar/GodotPlayBilling-debug.aar"]
			)
		return PackedStringArray(
			["res://addons/play_pilling/aar/GodotPlayBilling-release.aar"]
		)
	
	
	func _get_android_dependencies(
		platform: EditorExportPlatform, debug: bool) -> PackedStringArray:
		return PackedStringArray(
			["com.android.billingclient:billing-ktx:7.1.1"]
		)


func _enter_tree() -> void:
	_export_plugin = PlayBillingExportPlugin.new()
	add_export_plugin(_export_plugin)


func _exit_tree() -> void:
	remove_export_plugin(_export_plugin)
	_export_plugin = null
