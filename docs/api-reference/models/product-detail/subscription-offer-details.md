# ProductDetail.SubscriptionOfferDetails

Represents details about a subscription offer.


## Description

The SubscriptionOfferDetails class holds information about the subscription offer, including its base plan ID, pricing phases, and installment plan details.


## Properties

- `base_plan_id`: The unique identifier for the base plan.
- `installment_plan_details`: Details about the [InstallmentPlanDetails](installment-plan-details.md).
- `offer_id`: The unique identifier for the offer.
- `offer_tags`: Tags associated with the offer.
- `offer_token`: The token for the offer.
- `pricing_phase_list`: List of [PricingPhase](pricing-phase.md) for the offer.

## Methods


### Constructor

```gdscript
func _init(base_plan_id: String, installment_plan_details: InstallmentPlanDetails, offer_id: String, offer_tags: Array, offer_token: String, pricing_phase_list: Array[PricingPhase])
```

Initializes a new instance of [SubscriptionOfferDetails](subscription-offer-details.md).

**Parameters**:

  - `base_plan_id`: The unique identifier for the base plan.
  - `installment_plan_details`: Details about the installment plan.
  - `offer_id`: The unique identifier for the offer.
  - `offer_tags`: Tags associated with the offer.
  - `offer_token`: The token for the offer.
  - `pricing_phase_list`: List of pricing phases for the offer.

---

### from_json

```gdscript
static func from_json(json_string: String) -> SubscriptionOfferDetails
```

Static method to create a [SubscriptionOfferDetails](subscription-offer-details.md) instance from JSON data.

This method parses the JSON string and initializes a new [SubscriptionOfferDetails](subscription-offer-details.md)
instance with the parsed values.

**Parameters**
  - `json_string`: The JSON data as a string.

**Returns**: A new instance of [SubscriptionOfferDetails](subscription-offer-details.md) created from the JSON data.

---

### to_string

```gdscript
func to_string() -> String
```

Returns a string representation of the [SubscriptionOfferDetails](subscription-offer-details.md) instance.

**Returns**: A string detailing the [SubscriptionOfferDetails](subscription-offer-details.md) attributes, including base plan ID, offer ID, tags, token, and pricing phases.
