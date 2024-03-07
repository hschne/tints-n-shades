# frozen_string_literal: true

module TNS
  module Color
    # Hex color representation
    class Hex < Base
      attr_reader :red, :green, :blue

      def initialize(rgb)
        @red, @green, @blue = [rgb.red, rgb.green, rgb.blue].map { |color| normalize(color) }

        super()
      end

      def to_css
        "##{self}"
      end

      def to_s
        "#{red}#{green}#{blue}"
      end

      private

      # Set color value between allowed range and set to hex representation.
      def normalize(value)
        value.round.clamp(0, 255).to_s(16).rjust(2, "0")
      end
    end
  end
end
