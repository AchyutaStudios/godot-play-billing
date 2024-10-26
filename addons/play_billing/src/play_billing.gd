extends Node

class_name PlayBilling


static var _plugin


signal connected
signal disconnected
signal billing_resume
signal connect_error(error_code: BillingResponseCode, debug_message: String)
signal query_purchases_response(purchase_list: Array[Purchase])
signal query_purchases_error(error_code: BillingResponseCode, debug_message: String)
signal product_details_query_completed(product_detail_list: Array[ProductDetail])
signal product_details_query_error(error_code: BillingResponseCode, 
	debug_message: String, product_id_list: Array[String])
signal purchases_updated(purchases: Array[Purchase])
signal purchases_updated_error(error_code: BillingResponseCode, debug_message: String)
signal purchase_consumed(purchase_token: String)
signal purchase_consumption_error(error_code: BillingResponseCode, 
	debug_message: String, purchase_token: String)
signal purchase_acknowledged(purchase_token: String)
signal purchase_acknowledgement_error(error_code: BillingResponseCode, 
	debug_message: String, purchase_token: String)


enum BillingResponseCode {
	OK = 0,
	USER_CANCELED = 1,
	SERVICE_UNAVAILABLE = 2,
	BILLING_UNAVAILABLE = 3,
	ITEM_UNAVAILABLE = 4,
	DEVELOPER_ERROR = 5,
	ERROR = 6,
	ITEM_ALREADY_OWNED = 7,
	ITEM_NOT_OWNED = 8,
	NETWORK_ERROR = 12,
	SERVICE_DISCONNECTED = -1,
	FEATURE_NOT_SUPPORTED = -2,
	SERVICE_TIMEOUT = -3
}


enum ConnectionState {
	DISCONNECTED = 0,
	CONNECTING = 1,
	CONNECTED = 2,
	CLOSED = 3,
}


enum ProductType {
	INAPP,
	SUBS,
}


static func string_to_product_type(type_string: String) -> ProductType:
	var type: ProductType
	
	if type_string == "inapp":
		type = ProductType.INAPP
	elif type_string == "subs":
		type = ProductType.SUBS
	else:
		push_error("Invalid type_string.")
	
	return type


static func product_type_to_string(type: ProductType) -> String:
	var type_string: String
	match type:
		ProductType.INAPP:
			type_string = "inapp"
		ProductType.SUBS:
			type_string = "subs"
	return type_string


func _init() -> void:
	if (OS.get_name() == "Android"):
		if (Engine.has_singleton("GodotPlayBilling")):
			_plugin = Engine.get_singleton("GodotPlayBilling")
			
			_plugin.connected.connect(_connected)
			_plugin.disconnected.connect(_disconnected)
			_plugin.billing_resume.connect(_billing_resume)
			_plugin.connect_error.connect(_connect_error)
			_plugin.query_purchases_response.connect(_query_purchases_response)
			_plugin.query_purchases_error.connect(_query_purchases_error)
			_plugin.product_details_query_completed.connect(_product_details_query_completed)
			_plugin.product_details_query_error.connect(_product_details_query_error)
			_plugin.purchases_updated.connect(_purchases_updated)
			_plugin.purchases_updated_error.connect(_purchases_updated_error)
			_plugin.purchase_consumed.connect(_purchase_consumed)
			_plugin.purchase_consumption_error.connect(_purchase_consumption_error)
			_plugin.purchase_acknowledged.connect(_purchase_acknowledged)
			_plugin.purchase_acknowledgement_error.connect(_purchase_acknowledgement_error)
		else:
			printerr("GodotPlayBilling not found. Make sure you have enabled 'Gradle Build' and the GodotPlayBilling plugin in your Android export settings! IAP will not work.")
	else:
		printerr("Google Play Billing is only supported on Android. The current platform does not support it.")
	


func start_connection() -> void:
	if _plugin:
		_plugin.startConnection()


func end_connection() -> void:
	if _plugin:
		_plugin.endConnection()


func is_ready() -> bool:
	if _plugin:
		return _plugin.isReady()
	return false


func get_connection_state() -> ConnectionState:
	if _plugin:
		return _plugin.getConnectionState()
	return ConnectionState.CLOSED


func query_purchase(type: ProductType) -> void:
	if _plugin:
		_plugin.queryPurchase(product_type_to_string(type))


func query_product_details(product_id_list: Array[String], type: ProductType) -> void:
	if _plugin:
		_plugin.queryProductDetails(product_id_list, product_type_to_string(type))


func purchase(product_id: String) -> Dictionary:
	if _plugin:
		return _plugin.purchase(product_id)
	return {}


func subscribe(product_id: String, selected_offer_token: String = "") -> Dictionary:
	if _plugin:
		return _plugin.subscribe(product_id, selected_offer_token)
	return {}


func consume_purchase(purchase_token: String) -> void:
	if _plugin:
		_plugin.consumePurchase(purchase_token)


func acknowledge_purchase(purchase_token: String) -> void:
	if _plugin:
		_plugin.acknowledgePurchase(purchase_token)


func _connected() -> void: 
	connected.emit()


func _disconnected() -> void:
	disconnected.emit()


func _billing_resume() -> void:
	billing_resume.emit()


func _connect_error(
	error_code: BillingResponseCode, debug_message: String) -> void:
	connect_error.emit(error_code, debug_message) 


func _query_purchases_response(purchase_list: String) -> void:
	query_purchases_response.emit(
		Utility.from_Json_to_Purchase_List(purchase_list)
	)


func _query_purchases_error(error_code: BillingResponseCode, debug_message: String) -> void:
	query_purchases_error.emit(error_code, debug_message)


func _product_details_query_completed(product_detail_list: String) -> void:
	product_details_query_completed.emit(
		Utility.from_Json_to_ProductDetails_List(product_detail_list)
	)


func _product_details_query_error(error_code: BillingResponseCode, 
	debug_message: String, product_id_list: Array[String]) -> void:
	product_details_query_error.emit(error_code, debug_message, product_id_list)


func _purchases_updated(purchases: String) -> void:
	purchases_updated.emit(Utility.from_Json_to_Purchase_List(purchases))


func _purchases_updated_error(error_code: BillingResponseCode, 
	debug_message: String) -> void:
	purchases_updated_error.emit(error_code, debug_message)


func _purchase_consumed(purchase_token: String) -> void:
	purchase_consumed.emit(purchase_token)


func _purchase_consumption_error(error_code: BillingResponseCode, 
	debug_message: String, purchase_token: String) -> void:
	purchase_consumption_error.emit(error_code, debug_message, purchase_token)


func _purchase_acknowledged(purchase_token: String) -> void:
	purchase_acknowledged.emit(purchase_token)


func _purchase_acknowledgement_error(error_code: BillingResponseCode, 
	debug_message: String, purchase_token: String) -> void:
	purchase_acknowledgement_error.emit(error_code, debug_message, purchase_token)
