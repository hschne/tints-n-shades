# frozen_string_literal: true

require "json"

module TNS
  module Output
    # Output a given color palette as Tailwind JSON.
    class Tailwind
      def initialize(name)
        @name = name
      end

      def format(palette)
        colors = palette.map { |variant| format_variant(variant) }
        JSON.pretty_generate({ "#{@name}" => colors.reduce({}, :merge) })
      end

      def format_variant(variant)
        { "#{variant.index * 100}" => variant.to_css.to_s }
      end
    end
  end
end
