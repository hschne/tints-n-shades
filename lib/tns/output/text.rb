# frozen_string_literal: true

module TNS
  module Output
    # Output a given palette as text, for consumption from the terminal.
    class Text
      def initialize(name, format)
        @name = name
        @format = format
      end

      def format(palette)
        palette
          .map { |variant| format_class.new(variant, @name) }
          .map(&:to_s)
          .map { |string| "#{string};" }
          .join("\n")
      end

      def format_class
        case @format
        when "css"
          Output::CSSVariable
        when "sass"
          Output::SASSVariable
        else
          raise ArgumentError, "Invalid color format #{@color_format}"
        end
      end
    end
  end
end
