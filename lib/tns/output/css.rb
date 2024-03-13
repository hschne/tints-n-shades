# frozen_string_literal: true

module TNS
  module Output
    # Output a given color as CSS property (aka. variable).
    class CSS
      def initialize(name)
        @name = name
      end

      def format(palette)
        palette
          .map { |variant| format_variant(variant) }
          .map(&:to_s)
          .map { |string| "#{string};" }
          .join("\n")
      end

      def format_variant(variant)
        "--#{@name}-#{variant.index * 100}: #{variant.to_css}"
      end
    end
  end
end
