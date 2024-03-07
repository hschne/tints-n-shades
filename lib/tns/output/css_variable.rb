# frozen_string_literal: true

module TNS
  module Output
    # Output a given color as CSS property (aka. variable).
    class CSSVariable
      def initialize(color_variant, name, prefix: "color")
        @variant = color_variant
        @name = name
        @prefix = prefix
      end

      def to_s
        name = @prefix.nil? ? @name : "#{@prefix}-#{@name}"
        "--#{name}-#{@variant.index * 100}=#{@variant.to_css}"
      end
    end
  end
end
