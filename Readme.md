# RGB LED

An RGB LED controller for AT microcontrollers with bonus RSpec formatter.

## Install

### Bundler: `gem 'rgb_led'`

### RubyGems: `gem install rgb_led`

## Usage

```rb
require 'rgb_led'

RGBLED::Controller.open('/dev/usbdevicepath') do |controller|
  controller.red
  sleep 1
  controller.green
  sleep 1
  controller.blue
  sleep 1
  controller.update(1, 0.1, 0) # Yellow. Really depends on how bright each diode is within the LED
  sleep 1
  controller.off
end
```

## Without Block

```rb
require 'rgb_led'

controller = RGBLED::Controller.open('/dev/usbdevicepath')
# ...
controller.close
```

## RSpec Formatter

> Note: You can use multiple formatters with RSpec by passing multiple `--format` options.

**spec_helper.rb**

```rb
RSpec.configure do |config|
  # ...
  config.rgb_led_path = '/dev/usbdevicepath'
  # ...
end
```

**.rspec**

```
--format RGBLED::RSpecFormatter
```

## Copyright

Copyright © 2016 Ryan Scott Lewis <ryanscottlewis@gmail.com>.

The MIT License (MIT) - See License.md for further details.

