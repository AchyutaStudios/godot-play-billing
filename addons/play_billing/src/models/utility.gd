extends Object

class_name Utility


static func from_Json_to_PricingPhase_List(data: Variant) -> Array[ProductDetail.PricingPhase]:
	var pricing_phase_list: Array[ProductDetail.PricingPhase] = []
	
	for item in data:
		var pricing_phase: ProductDetail.PricingPhase = ProductDetail.PricingPhase.from_json(item)
		pricing_phase_list.append(pricing_phase)
	
	return pricing_phase_list


static func from_Json_to_SubscriptionOfferDetails_List(data: Variant) -> Array[ProductDetail.SubscriptionOfferDetails]:
	var list: Array[ProductDetail.SubscriptionOfferDetails] = []
	
	for item in data:
		var subs: ProductDetail.SubscriptionOfferDetails = ProductDetail.SubscriptionOfferDetails.from_json(item)
		list.append(subs)
	
	return list


static func from_Json_to_Purchase_List(json_string: String) -> Array[Purchase]:
	var list: Array[Purchase] = []
	var data = JSON.parse_string(json_string)
	
	for item in data:
		var purchase: Purchase = Purchase.from_json(item)
		list.append(purchase)
	
	return list


static func from_Json_to_ProductDetails_List(json_string: String) -> Array[ProductDetail]:
	var list: Array[ProductDetail] = []
	var data = JSON.parse_string(json_string)
	
	for item in data:
		var product_detail: ProductDetail = ProductDetail.from_json(item)
		list.append(product_detail)
	
	return list
