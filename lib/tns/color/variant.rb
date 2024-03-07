# frozen_string_literal: true

require "forwardable"

module TNS
  module Color
    # A variant of a color, which could be either a tint or a shade.
    class Variant
      extend Forwardable

      attr_reader :color, :step

      def_delegators :@color, :to_css, :to_hex, :to_s

      def initialize(color, step)
        @color = color
        @step = step
      end

      # Return the step relative to base color. Step 0 has in index of 5,
      # tints and shades have indices relative to that.
      def index
        raise NotImplementedError("Implement this for shades or tints")
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
