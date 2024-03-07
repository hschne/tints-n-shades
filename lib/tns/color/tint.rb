# frozen_string_literal: true

require "forwardable"

module TNS
  module Color
    # A variant of a color, which could be either a tint or a shade.
    class Tint < Variant
      def index
        5 - step
      end
    end
  end
end
