require 'stringio'
require 'rgb_led/controller'

RSpec.configuration.add_setting(:rgb_led_path, default: '/dev/cu.usbmodem1431')

module RGBLED
  class RSpecFormatter
    class << self
      attr_reader :path

      def path=(value)
        value = value.to_s.strip

        return nil if value.empty?
        return nil unless File.exist?(value)

        @path = value
      end
    end

    def initialize(output)
      @output = output || StringIO.new
      @state  = :green
    end

    def start(notification)
      path        = RSpec.configuration.rgb_led_path
      @controller = RGBLED::Controller.open(path) unless path.nil?

      @controller.off
    end

    def example_pending(notification)
      @state = :yellow if @state == :green
    end

    def example_failed(notification)
      @state = :red
    end

    def close(notification)
      return if @controller.nil?

      case @state
      when :green  then @controller.green
      when :yellow then @controller.update(1, 0.1, 0)
      when :red    then @controller.red
      end
    end

    RSpec::Core::Formatters.register(self, :start, :example_pending, :example_failed, :close)
  end
end

