# frozen_string_literal: true

module TNS
  module Output
    # Output a given color as SASS variable.
    class SASS
      def initialize(name)
        @name = name
      end

      def format(palette)
        palette
          .map { |variant| format_variant(variant) }
          .map { |string| "#{string};" }
          .join("\n")
      end

      def format_variant(variant)
        "$#{@name}-#{variant.index * 100}=#{variant.to_css}"
      end
    end
  end
end
