# frozen_string_literal: true

module TNS
  module Output
    # Output a given color as CSS property (aka. variable).
    class SASSVariable
      def initialize(color_variant, name)
        @variant = color_variant
        @name = name
      end

      def to_s
        "$#{@name}-#{@variant.index * 100}=#{@variant.to_css}"
      end
    end
  end
end
