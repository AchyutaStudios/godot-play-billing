# MIT License
# 
# Copyright (c) 2024-present Achyuta Studios
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# 
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

extends Object

class_name Utility


static func from_Json_to_PricingPhase_List(
	data: Variant
	) -> Array[ProductDetail.PricingPhase]:
	var pricing_phase_list: Array[ProductDetail.PricingPhase] = []
	
	for item in data:
		var pricing_phase: ProductDetail.PricingPhase = ProductDetail.PricingPhase.from_json(item)
		pricing_phase_list.append(pricing_phase)
	
	return pricing_phase_list


static func from_Json_to_SubscriptionOfferDetails_List(
	data: Variant
	) -> Array[ProductDetail.SubscriptionOfferDetails]:
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


static func from_Json_to_ProductDetails_List(
	json_string: String
	) -> Array[ProductDetail]:
	var list: Array[ProductDetail] = []
	var data = JSON.parse_string(json_string)
	
	for item in data:
		var product_detail: ProductDetail = ProductDetail.from_json(item)
		list.append(product_detail)
	
	return list
