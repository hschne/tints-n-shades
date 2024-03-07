# frozen_string_literal: true

module TNS
  class Palette
    def initialize(color)
      @color = color
    end

    def shades
      (1..9).each_with_object([]) do |index, object|
        object << @color.shade(index)
      end
    end

    def tints
      (1..9).each_with_object([]) do |index, object|
        object << @color.tint(index)
      end
    end

    def to_a
      shades + [Tint.new(color, 0)] + tints
    end
  end
end
