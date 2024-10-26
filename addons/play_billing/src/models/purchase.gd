extends Object

class_name Purchase


var developer_payload: String
var order_id: String
var original_json: String
var package_name: String
var product_ids: Array[String]
var purchase_token: String
var quantity: int
var signature: String
var is_acknowledged: bool
var is_auto_renewing: bool
var purchase_time: float
var purchase_state: PurchaseState


func _init(developer_payload: String, order_id: String, original_json: String, 
			package_name: String, product_ids: Array[String], purchase_token: String, 
			quantity: int, signature: String, is_acknowledged: bool, 
			is_auto_renewing: bool, purchase_time: int, purchase_state: PurchaseState):
	self.developer_payload = developer_payload
	self.order_id = order_id
	self.original_json = original_json
	self.package_name = package_name
	self.product_ids = product_ids
	self.purchase_token = purchase_token
	self.quantity = quantity
	self.signature = signature
	self.is_acknowledged = is_acknowledged
	self.is_auto_renewing = is_auto_renewing
	self.purchase_time = purchase_time
	self.purchase_state = purchase_state

static func from_json(data: Variant) -> Purchase:
	var ids = data.get("product_ids", [])
	var ids_array: Array[String] = []
	
	ids_array.append_array(ids)
	
	return Purchase.new(
		data.get("developer_payload", ""),
		data.get("order_id", ""),
		data.get("original_json", ""),
		data.get("package_name", ""),
		ids_array,
		data.get("purchase_token", ""),
		data.get("quantity", 0),
		data.get("signature", ""),
		data.get("is_acknowledged", false),
		data.get("is_auto_renewing", false),
		data.get("purchase_time", 0),
		data.get("purchase_state", 0)
	)
	
	
func to_string() -> String:
	var details: Array = []
	details.append("Purchase:")
	details.append(" - Developer Payload: " + developer_payload)
	details.append(" - Order ID: " + order_id)
	details.append(" - Original JSON: " + original_json)
	details.append(" - Package Name: " + package_name)
	details.append(" - Product IDs: " + str(product_ids))
	details.append(" - Purchase Token: " + purchase_token)
	details.append(" - Quantity: " + str(quantity))
	details.append(" - Signature: " + signature)
	details.append(" - Acknowledged: " + str(is_acknowledged))
	details.append(" - Auto Renewing: " + str(is_auto_renewing))
	details.append(" - Purchase Time: " + str(purchase_time))
	details.append(" - Purchase State: " + str(purchase_state))
	
	return "\n".join(details)
	


enum PurchaseState {
	UNSPECIFIED_STATE = 0,
	PURCHASED = 1,
	PENDING = 2,
}
