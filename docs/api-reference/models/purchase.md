# Purchase

Represents a single in-app purchase, encapsulating details such as order ID, product IDs, purchase state, and more.


## Description

This class allows initialization of purchase details from JSON data
and includes methods to represent the purchase as a string for easy
logging or debugging. Each purchase object contains essential properties
to track and verify in-app transactions and their state.


## Properties

- `developer_payload`: Developer-defined payload associated with this purchase.
- `order_id`: Unique order ID associated with this purchase.
- `original_json`: Original JSON string representing the purchase details as provided by the billing API.
- `package_name`: Package name of the application where the purchase was made.
- `product_ids`: Array of product IDs purchased in this transaction.
- `purchase_token`: Token uniquely identifying this purchase, used for validation and acknowledgment.
- `quantity`: Quantity of the purchased item(s).
- `signature`: Digital signature for verifying the purchase integrity and authenticity.
- `is_acknowledged`: Indicates whether the purchase has been acknowledged by the app.
- `is_auto_renewing`: Indicates if the purchase is set to auto-renew (for subscriptions).
- `purchase_time`: Timestamp of the purchase, in milliseconds.
- `purchase_state`: State of the purchase, as defined in the [PurchaseState](purchase.md#purchasestate).


## Enum

### `PurchaseState`

Represents potential states of a purchase.

  - `UNSPECIFIED_STATE`: Unspecified purchase state.
  - `PURCHASED`: Purchase has been completed and approved.
  - `PENDING`: Purchase is pending approval or completion.


## Methods

### Constructor

```gdscript
func _init(developer_payload: String, order_id: String, original_json: String, package_name: String, product_ids: Array[String], purchase_token: String, quantity: int, signature: String, is_acknowledged: bool, is_auto_renewing: bool, purchase_time: int, purchase_state: PurchaseState)
```

Initializes the Purchase object with provided purchase details.

- **Parameters**:
  - `developer_payload`: Developer-defined payload for validation purposes.
  - `order_id`: Unique order ID.
  - `original_json`: JSON string of the purchase details.
  - `package_name`: Application's package name.
  - `product_ids`: Array of product IDs in this purchase.
  - `purchase_token`: Unique token for this purchase.
  - `quantity`: Quantity of items purchased.
  - `signature`: Signature for integrity verification.
  - `is_acknowledged`: Boolean indicating if the purchase is acknowledged.
  - `is_auto_renewing`: Boolean indicating if the purchase is auto-renewing.
  - `purchase_time`: Timestamp of the purchase.
  - `purchase_state`: Purchase state as defined in `enum PurchaseState`.

---

### from_json

```gdscript
static func from_json(data: Variant) -> Purchase
```

Static method to create a `Purchase` instance from JSON data.

**Parameters**:

  - `data`: JSON-like Variant containing purchase details.

**Returns**: A [Purchase](purchase.md) object initialized with JSON data.

---

### to_string

```gdscript
func to_string() -> String
```

Provides a detailed string representation of the purchase object, listing all fields.

**Returns**: A string containing the details of the purchase.