# ProductDetail.InstallmentPlanDetails

Represents the details of an installment plan.


## Description

The InstallmentPlanDetails class holds information about the commitment payments for an installment plan.


## Properties

- `installment_plan_commitment_payments_count`: Number of commitment payments.
- `subsequent_installment_plan_commitment_payments_count`: Number of subsequent commitment payments.


## Methods


### Constructor

```gdscript
func _init(installment_plan_commitment_payments_count: int, subsequent_installment_plan_commitment_payments_count: int)
```

Initializes a new instance of [InstallmentPlanDetails](installment-plan-details.md).

**Parameters**:

  - `installment_plan_commitment_payments_count`: Number of commitment payments.
  - `subsequent_installment_plan_commitment_payments_count`: Number of subsequent commitment payments.

---

### from_json

```gdscript
static func from_json(data: Variant) -> InstallmentPlanDetails
```

Static method to create an [InstallmentPlanDetails](installment-plan-details.md) instance from JSON data.

This method parses the JSON data and initializes a new [InstallmentPlanDetails](installment-plan-details.md)
instance with the parsed values.

**Parameters**:

  - `data`: The JSON data as a Variant.

**Returns**: A new instance of [InstallmentPlanDetails](installment-plan-details.md) created from the JSON data.

---

### to_string

```gdscript
func to_string() -> String
```

Returns a string representation of the [InstallmentPlanDetails](installment-plan-details.md) instance.

**Returns**: A string detailing the [InstallmentPlanDetails](installment-plan-details.md) attributes, including commitment payments and subsequent commitment payments.
