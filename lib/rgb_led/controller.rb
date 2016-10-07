module RGBLED
  class Controller
    # Open the USB device for the RGB controller
    #
    # @param [String] path The path to the USB device
    def self.open(path, &block)
      new.open(path, &block)
    end

    # Open the USB device for the RGB controller
    #
    # @param [String] path The path to the USB device
    def open(path, &block)
      @io = File.open(path, 'r+') # TODO: r+ will create the file if it doesn't exist =(

      @io.readbyte # Sync

      if block_given?
        yield(self)

        close
      end

      self
    end

    # Close the device
    def close
      return if @io.nil?

      @io.close
    end

    # Update the RGB LED color using floats between 0.0...1.0
    #
    # @param [#to_f] red
    # @param [#to_f] green
    # @param [#to_f] blue
    def update(red, green, blue)
      return false if @io.nil?

      red   = convert_float_to_byte(red)
      green = convert_float_to_byte(green)
      blue  = convert_float_to_byte(blue)

      @io.write(red)
      @io.write(green)
      @io.write(blue)

      return true
    end

    # Turn off the LED entirely
    def off
      update(0, 0, 0)
    end

    # Set the RGB LED to the color red
    #
    # @param [#to_f] brightness
    def red(brightness=1.0)
      update(brightness, 0, 0)
    end

    # Set the RGB LED to the color green
    #
    # @param [#to_f] brightness
    def green(brightness=1.0)
      update(0, brightness, 0)
    end

    # Set the RGB LED to the color blue
    #
    # @param [#to_f] brightness
    def blue(brightness=1.0)
      update(0, 0, brightness)
    end

    protected

    def convert_float_to_byte(value)
      value = value.to_f
      value = 0.0 if value < 0
      value = 1.0 if value > 1
      value = value * 255

      value.to_i.chr
    end
  end
end

