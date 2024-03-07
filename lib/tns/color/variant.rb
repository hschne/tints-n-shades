# frozen_string_literal: true

require "forwardable"

module TNS
  module Color
    # A variant of a color, which could be either a tint or a shade.
    class Variant < Base
      extend Forwardable

      attr_reader :color, :step

      def_delegators :@color, :to_css, :to_s

      def initialize(color, step)
        @color = color
        @step = step
        super()
      end

      # Change the internal color representation to Hex
      def to_hex
        @color = @color.to_hex
        self
      end

      # Change the internal color representation to HSL
      def to_hsl
        @color = @color.to_hsl
        self
      end

      # Return the step relative to base color. Step 0 has in index of 5,
      # tints and shades have indices relative to that.
      def index
        raise NotImplementedError("Implement this for shades or tints")
      end
    end
  end
end
