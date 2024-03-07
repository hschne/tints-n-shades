# frozen_string_literal: true

module TNS
  # Represents a palette based on a color
  class Palette
    def initialize(color)
      @color = color
    end

    def tints
      (1..4).each_with_object([]) do |index, object|
        object << @color.tint(index)
      end.reverse
    end

    def shades
      (1..4).each_with_object([]) do |index, object|
        object << @color.shade(index)
      end
    end

    def to_a
      tints + [Color::Tint.new(@color, 0)] + shades
    end
  end
end
