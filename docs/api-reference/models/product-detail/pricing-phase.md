# ProductDetail.PricingPhase

Represents the pricing phase of a product.

## Description

This class holds details about the billing cycle, pricing, and recurrence mode for a pricing phase.


## Properties

- `billing_cycle_count`: The number of billing cycles.
- `billing_period`: The billing period (e.g., monthly).
- `formatted_price`: The price formatted for display.
- `price_amount_micros`: The price amount in micros.
- `price_currency_code`: The currency code for the price.
- `recurrence_mode`: The recurrence mode for billing.

## Methods

### Constructor

```gdscript
func _init(billing_cycle_count: int, billing_period: String, formatted_price: String, price_amount_micros: int, price_currency_code: String, recurrence_mode: int)
```

Initializes a new instance of [PricingPhase](pricing-phase.md).

**Parameters**:

  - `billing_cycle_count`: Number of billing cycles.
  - `billing_period`: The period of billing (e.g., monthly).
  - `formatted_price`: The price formatted for display.
  - `price_amount_micros`: The price amount in micros.
  - `price_currency_code`: The currency code for the price.
  - `recurrence_mode`: The recurrence mode for billing.

---

### from_json

```gdscript
static func from_json(data: Variant) -> PricingPhase
```

Static method to create a [PricingPhase](pricing-phase.md) instance from JSON data.

This method parses the JSON data and initializes a new [PricingPhase](pricing-phase.md)
instance with the parsed values.

**Parameters**:

  - `data`: The JSON data as a Variant.

**Returns**: A new instance of [PricingPhase](pricing-phase.md) created from the JSON data.

---

### to_string

```gdscript
func to_string() -> String
```

Returns a string representation of the [PricingPhase](pricing-phase.md) instance.

**Returns**: A string detailing the [PricingPhase](pricing-phase.md) attributes, including billing cycle count, billing period, formatted price, price amount in micros, price currency code, and recurrence mode.
