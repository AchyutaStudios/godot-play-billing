# ProductDetail

Represents the details of a product in the Play Billing system.

## Description
The [ProductDetail](index.md) class holds various attributes related to a product, including its name, description, pricing, and more.

## Properties

- `name`: The name of the product.
- `description`: A brief description of the product.
- `one_time_purchase_offer_details`: Details about one-time purchase offers.
- `product_id`: The unique identifier for the product.
- `product_type`: The type of the product (e.g., in-app product, subscription).
- `subscription_offer_detail_list`: List of subscription offer details.
- `title`: The title of the product.

## Methods

### Constructor

```gdscript
func _init(name: String, description: String, one_time_purchase_offer_details: OneTimePurchaseOfferDetails, product_id: String, product_type: String, subscription_offer_detail_list: Array[SubscriptionOfferDetails], title: String)
```

Initializes a new instance of [ProductDetail](index.md).

This constructor takes the essential parameters for creating a product
detail instance, including name, description, and other relevant data.

**Parameters**:

  - `name`: The name of the product.
  - `description`: A brief description of the product.
  - `one_time_purchase_offer_details`: Details about one-time purchase offers.
  - `product_id`: The unique identifier for the product.
  - `product_type`: The type of the product, converted from string to enum.
  - `subscription_offer_detail_list`: List of subscription offer details.
  - `title`: The title of the product.

---

### from_json 

```gdscript
static func from_json(data: Variant) -> ProductDetail
```

Static method to create a [ProductDetail](index.md) instance from JSON data.

This method parses the JSON data and initializes a new [ProductDetail](index.md)
instance with the parsed values.

**Parameters**:

  - `data`: The JSON data as a Variant.

**Returns**: A new instance of [ProductDetail](index.md) created from the JSON data.

---

### to_string

```gdscript
func to_string() -> String
```

Returns a string representation of the [ProductDetail](index.md) instance.

**Returns**: A string detailing the [ProductDetail](index.md) attributes, including title, name, description, product ID, product type, one-time purchase offer details, and subscription offer details list.
