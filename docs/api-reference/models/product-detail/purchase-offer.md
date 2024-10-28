# ProductDetail.OneTimePurchaseOfferDetails

Represents details about a one-time purchase offer.


## Description

The OneTimePurchaseOfferDetails class holds pricing information related to a one-time purchase offer.


## Properties

- `formatted_price`: The formatted price for display.
- `price_amount_micros`: The price amount in micros.
- `price_currency_code`: The currency code for the price.


## Methods


### Constructor

```gdscript
func _init(formatted_price: String, price_amount_micros: float, price_currency_code: String)
```

Initializes a new instance of [OneTimePurchaseOfferDetails](purchase-offer.md).

**Parameters**:

  - `formatted_price`: The formatted price for display.
  - `price_amount_micros`: The price amount in micros.
  - `price_currency_code`: The currency code for the price.

---

### from_json

```gdscript
static func from_json(data: Variant) -> OneTimePurchaseOfferDetails
```

Static method to create a [OneTimePurchaseOfferDetails](purchase-offer.md) instance from JSON data.

This method parses the JSON data and initializes a new [OneTimePurchaseOfferDetails](purchase-offer.md)
instance with the parsed values.

**Parameters**:

  - `data`: The JSON data as a Variant.

**Returns**: A new instance of [OneTimePurchaseOfferDetails](purchase-offer.md) created from the JSON data.

---

### to_string

```gdscript
func to_string() -> String
```

Returns a string representation of the [OneTimePurchaseOfferDetails](purchase-offer.md) instance.

**Returns**: A string detailing the [OneTimePurchaseOfferDetails](purchase-offer.md) attributes, including formatted price, price amount in micros, and price currency code.
