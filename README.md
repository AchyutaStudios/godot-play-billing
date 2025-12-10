# Godot Play Billing

Welcome to the **Godot Play Billing Library**!

This plugin simplifies integration with the Google Play Billing system by providing a GDScript-based interface. Developers can easily implement billing features without needing to write any Kotlin or Java code, making it accessible even for those without prior Android development experience.

## Quick Start

To get started, follow these steps:

- [Download the Library](https://luminixstudios.github.io/godot-play-billing/get-started/download/).
- [Follow Installation Guide](https://luminixstudios.github.io/godot-play-billing/get-started/installation/).
<!-- - Run a simple billing example to verify your setup. -->

## Example

```gdscript
# The PlayBilling node is provided by the plugin, 
# encapsulating all necessary signals and methods for Google Play Billing.
@onready var _play_billing: PlayBilling = $PlayBilling


func _ready():
    # Initiate the connection to the Google Play Billing service.
    _play_billing.start_connection()


func _on_play_billing_connected() -> void:
    # Connection is established.
```

## Documentation
Comprehensive documentation is available [here](https://luminixstudios.github.io/godot-play-billing) and includes:

- [Introduction](https://luminixstudios.github.io/godot-play-billing/)
- Getting Started
  - [Download](https://luminixstudios.github.io/godot-play-billing/get-started/download/)
  - [Installation](https://luminixstudios.github.io/godot-play-billing/get-started/installation/)
- [Integration](https://luminixstudios.github.io/godot-play-billing/integrate/)
- [API Reference](https://luminixstudios.github.io/godot-play-billing/api-reference/)

## Support
[![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/N4N41CL8JJ)
 
