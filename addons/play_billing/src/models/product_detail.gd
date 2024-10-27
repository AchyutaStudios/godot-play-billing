extends Object

class_name ProductDetail


var name: String
var description: String
var one_time_purchase_offer_details: OneTimePurchaseOfferDetails
var product_id: String
var product_type: PlayBilling.ProductType
var subscription_offer_detail_list: Array[SubscriptionOfferDetails]
var title: String


func _init(name: String, description: String, 
	one_time_purchase_offer_details: OneTimePurchaseOfferDetails, 
	product_id: String, product_type: String, 
	subscription_offer_detail_list: Array[SubscriptionOfferDetails], 
	title: String):
	self.name = name
	self.description = description
	self.one_time_purchase_offer_details = one_time_purchase_offer_details
	self.product_id = product_id
	self.product_type = PlayBilling.string_to_product_type(product_type)
	self.subscription_offer_detail_list = subscription_offer_detail_list
	self.title = title
	
func to_string() -> String:
	var details: String = "ProductDetail:\n"
	details += "  Title: %s\n" % title
	details += "  Name: %s\n" % name
	details += "  Description: %s\n" % description
	details += "  Product ID: %s\n" % product_id
	details += "  Product Type: %s\n" % PlayBilling.product_type_to_string(product_type)
	details += "  One-Time Purchase Offer Details: %s\n" % (get("one_time_purchase_offer_details").to_string() if one_time_purchase_offer_details != null else "None")
	details += "  Subscription Offer Details List:\n"
	for sub_offer in subscription_offer_detail_list:
		details += "    - %s\n" % sub_offer.to_string()
	return details


static func from_json(data: Variant) -> ProductDetail:
	
	var offer_string = data.get("one_time_purchase_offer_details", null)
	var offer: OneTimePurchaseOfferDetails = null
	if offer_string != null:
		offer = OneTimePurchaseOfferDetails.from_json(offer_string)
	
	var subs_offer_string = data.get("subscription_offer_detail_list", [])
	var subs_offer: Array[SubscriptionOfferDetails] = []
	if subs_offer_string != []:
		subs_offer = Utility.from_Json_to_SubscriptionOfferDetails_List(subs_offer_string)
	
	return ProductDetail.new(
		data.get("name", ""),
		data.get("description", ""),
		offer,
		data.get("product_id", ""),
		data.get("product_type", 0),
		subs_offer,
		data.get("title", "")
	)


class PricingPhase:
	
	var billing_cycle_count: int
	var billing_period: String
	var formatted_price: String
	var price_amount_micros: int
	var price_currency_code: String
	var recurrence_mode: int
	
	func _init(billing_cycle_count: int, billing_period: String, 
			formatted_price: String, price_amount_micros: int, 
			price_currency_code: String, recurrence_mode: int
		):
		self.billing_cycle_count = billing_cycle_count
		self.billing_period = billing_period
		self.formatted_price = formatted_price
		self.price_amount_micros = price_amount_micros
		self.price_currency_code = price_currency_code
		self.recurrence_mode = recurrence_mode
	
	
	static func from_json(data: Variant) -> PricingPhase:
		return PricingPhase.new(
			data.get("billing_cycle_count", 0),
			data.get("billing_period", ""),
			data.get("formatted_price", ""),
			data.get("price_amount_micros", 0),
			data.get("price_currency_code", ""),
			data.get("recurrence_mode", 0)
		)
	
	
	func to_string() -> String:
		return "PricingPhase(billing_cycle_count=%d, billing_period=%s, formatted_price=%s, price_amount_micros=%d, price_currency_code=%s, recurrence_mode=%d)" % [
			billing_cycle_count, billing_period, formatted_price, price_amount_micros, price_currency_code, recurrence_mode
		]



class OneTimePurchaseOfferDetails:
	
	var formatted_price: String
	var price_amount_micros: float
	var price_currency_code: String
	
	func _init(
		formatted_price: String, 
		price_amount_micros: float, 
		price_currency_code: String):
		self.formatted_price = formatted_price
		self.price_amount_micros = price_amount_micros
		self.price_currency_code = price_currency_code
	
	
	static func from_json(data: Variant) -> OneTimePurchaseOfferDetails:
		return OneTimePurchaseOfferDetails.new(
			data.get("formatted_price", ""),
			data.get("price_amount_micros", 0),
			data.get("price_currency_code", "")
		)
	
	
	func to_string() -> String:
		return "OneTimePurchaseOfferDetails(formatted_price=%s, price_amount_micros=%.2f, price_currency_code=%s)" % [
			formatted_price, price_amount_micros, price_currency_code
		]


class InstallmentPlanDetails:
	var installment_plan_commitment_payments_count: int
	var subsequent_installment_plan_commitment_payments_count: int
	
	
	func _init(
		installment_plan_commitment_payments_count: int, 
		subsequent_installment_plan_commitment_payments_count: int):
		self.installment_plan_commitment_payments_count = installment_plan_commitment_payments_count
		self.subsequent_installment_plan_commitment_payments_count = subsequent_installment_plan_commitment_payments_count
	
	
	static func from_json(data: Variant) -> InstallmentPlanDetails:
		return InstallmentPlanDetails.new(
			data.get("installment_plan_commitment_payments_count", 0),
			data.get("subsequent_installment_plan_commitment_payments_count", 0)
		)
	
	
	func to_string() -> String:
		return "InstallmentPlanDetails(installment_plan_commitment_payments_count=%d, subsequent_installment_plan_commitment_payments_count=%d)" % [
			installment_plan_commitment_payments_count, subsequent_installment_plan_commitment_payments_count
		]


class SubscriptionOfferDetails:
	
	var base_plan_id: String
	var installment_plan_details: InstallmentPlanDetails  
	var offer_id: String
	var offer_tags: Array[String]
	var offer_token: String
	var pricing_phase_list: Array[PricingPhase]
	
	func _init(base_plan_id: String, installment_plan_details: InstallmentPlanDetails, 
		offer_id: String, offer_tags: Array, offer_token: String, 
		pricing_phase_list: Array[PricingPhase]):
		self.base_plan_id = base_plan_id
		self.installment_plan_details = installment_plan_details
		self.offer_id = offer_id
		self.offer_tags = offer_tags
		self.offer_token = offer_token
		self.pricing_phase_list = pricing_phase_list
	
	
	static func from_json(json_string: String) -> SubscriptionOfferDetails:
		var data = JSON.parse_string(json_string)
		
		var installment_plan_details_string = data.get("installment_plan_details", null)
		var installment_plan_details: InstallmentPlanDetails = null
		if installment_plan_details_string != null:
			installment_plan_details = InstallmentPlanDetails.from_json(installment_plan_details_string)
		
		var pricing_phase_list_string = data.get("pricing_phase_list", null)
		var pricing_phase_list: Array[PricingPhase] = []
		if pricing_phase_list_string != null:
			pricing_phase_list = Utility.from_Json_to_PricingPhase_List(pricing_phase_list_string)
		
		return SubscriptionOfferDetails.new(
			data.get("base_plan_id", ""),
			installment_plan_details,
			data.get("offer_id", ""),
			data.get("offer_tags", []),
			data.get("offer_token", ""),
			pricing_phase_list
		)
	
	
	func to_string() -> String:
		var details = "SubscriptionOfferDetails:\n"
		details += "  Base Plan ID: %s\n" % base_plan_id
		details += "  Installment Plan Details: %s\n" % (installment_plan_details.to_string() if installment_plan_details != null else "None")
		details += "  Offer ID: %s\n" % offer_id
		details += "  Offer Tags: %s\n" % offer_tags
		details += "  Offer Token: %s\n" % offer_token
		details += "  Pricing Phase List:\n"
		for pricing_phase in pricing_phase_list:
			details += "    - %s\n" % pricing_phase.to_string()
		return details
