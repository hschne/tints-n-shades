# frozen_string_literal: true

module TNS
  module Color
    # HSL is our base representation for color objects.
    class HSL
      attr_reader :hue, :saturation, :lightness

      def initialize(rgb)
        @hue, @saturation, @lightness = from_rgb(rgb)
        super()
      end

      def to_css
        "hsl(#{self})"
      end

      def to_s
        format("%<hue>d %<saturation>d %<lightness>d", hue: @hue, saturation: @saturation, lightness: @lightness)
      end

      private

      def from_rgb(color)
        r, g, b = rgb(color)
        h, s, l = calculate_hsl(r, g, b)

        [(h * 360).round, (s * 100).round, (l * 100).round]
      end

      def rgb(color)
        r = color.red
        g = color.green
        b = color.blue
        r /= 255.0
        g /= 255.0
        b /= 255.0
        [r, g, b]
      end

      def normalize_hsl(min, max)
        h = (max + min) / 2.0
        s = (max + min) / 2.0
        l = (max + min) / 2.0
        [h, s, l]
      end

      def calculate_hsl(red, green, blue)
        min = [red, green, blue].min
        max = [red, green, blue].max
        h, s, l = normalize_hsl(min, max)

        if max == min
          h = 0
          s = 0 # achromatic
        else
          d = max - min
          s = l >= 0.5 ? d / (2.0 - max - min) : d / (max + min)
          h = calculate_hue(max, red, green, blue, d)
          h /= 6.0
        end
        [h, s, l]
      end

      def calculate_hue(max, red, green, blue, delta)
        case max
        when red
          ((green - blue) / delta) + (green < blue ? 6.0 : 0)
        when green
          ((blue - red) / delta) + 2.0
        when blue
          ((red - green) / delta) + 4.0
        end
      end
    end
  end
end
