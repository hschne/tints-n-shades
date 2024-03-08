# frozen_string_literal: true

module TNS
  module Output
    # Output a given palette as text, for consumption from the terminal.
    class JSON
      def initialize(name, color_format)
        @name = name
        @color_format = color_format
      end

      def format(palette)
        palette
          .map { |variant| format(color_format).new(variant, @name) }
          .map(&:to_s)
          .map { |string| "#{string};" }
          .join("\n")
      end
    end
  end
end
