# frozen_string_literal: true

module TNS
  module Color
    # Hex color representation
    class Hex
      attr_reader :red, :green, :blue

      def initialize(rgb)
        @red, @green, @blue = [rgb.red, rgb.green, rgb.blue].map { |color| normalize(color) }
      end

      def to_css
        "##{self}"
      end

      def to_s
        "#{red}#{green}#{blue}"
      end

      # Set color value between allowed range and set to hex representation.
      def normalize(value)
        value.round.clamp(0, 255).to_s(16).rjust(2, "0")
      end

      def ==(other)
        other.class == self.class && other.state == state
      end

      def state
        instance_variables.map { |variable| instance_variable_get variable }
      end
    end
  end
end
