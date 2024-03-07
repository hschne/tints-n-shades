# frozen_string_literal: true

module TNS
  # Input gets stuff from the user and converts
  class Input
    class << self
      def named_colors(colors)
        colors
          .to_h do |color|
          split = color.split(":")
          split << ordinal_numerals.next.to_s if split.size != 2
          split
        end
      end

      private

      def ordinal_numerals
        @ordinal_numerals ||= %w[
          primary secondary
          tertiary quartary
          quinary senary
          septenary octonary
          nonary decenary
        ].each
      end
    end
  end
end
