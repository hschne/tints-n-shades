# frozen_string_literal: true

module TNS
  module Color
    # RGB is our base representation for color objects.
    class RGB < Base
      attr_reader :red, :green, :blue

      def initialize(red = 0, green = 0, blue = 0)
        @red, @green, @blue = [red, green, blue].map { |color| normalize(color) }
        super()
      end

      def self.from_hex(color, &)
        hex = color.scan(/[0-9a-f]/i)
        case hex.size
        when 3
          new(*hex.map { |v| (v * 2).to_i(16) }, &)
        when 6
          new(*hex.each_slice(2).map { |v| v.join.to_i(16) }, &)
        else
          raise ArgumentError, "Invalid color #{color}. Please provide a color in hex format."
        end
      end

      # Return a new instance of RGB that is tinted by step
      def tint(step)
        red = @red + ((255 - @red) * step * 0.2)
        green = @green + ((255 - @green) * step * 0.2)
        blue = @blue + ((255 - @blue) * step * 0.2)
        Tint.new(RGB.new(red, green, blue), step)
      end

      # Return a new instance of RGB that is shaded by step
      def shade(step)
        red = @red * (1 - (0.2 * step))
        green = @green * (1 - (0.2 * step))
        blue = @blue * (1 - (0.2 * step))
        Shade.new(RGB.new(red, green, blue), step)
      end

      def to_hex
        Hex.new(self)
      end

      def to_hsl
        HSL.new(self)
      end

      def to_css
        "rgb(#{self})"
      end

      def to_s
        format("%<red>d %<green>d %<blue>d", red: @red, green: @green, blue: @blue)
      end

      def ==(other)
        other.class == self.class && other.state == state
      end

      def state
        instance_variables.map { |variable| instance_variable_get variable }
      end

      private

      # Set color value between allowed range.
      def normalize(value)
        value.round.clamp(0, 255)
      end
    end
  end
end
