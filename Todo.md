# TODO

* Sane defaults. Maybe a RGBLED.scan to find correct USB device? Or some kind of device reporter?
* i2c support
* ATTiny support? Much cheaper than ATMega. Must have 3 digital outputs with PWM support
* Other test suite formatters
* Use GPL? Look into other licenses
* Tests! Oh the irony..
* RSpec options
  * Custom colors for each state
  * Timeout for when to turn off
  * Change RSpec formatter config from `rgb_led_path` to a Hash `rgb_led[:path]` or even a Struct
* exe CLI options: red, green, blue, update, off, etc etc
