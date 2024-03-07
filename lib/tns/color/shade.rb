# frozen_string_literal: true

require "forwardable"

module TNS
  module Color
    # A shade of a color
    class Shade < Variant
      def index
        5 + step
      end
    end
  end
end
