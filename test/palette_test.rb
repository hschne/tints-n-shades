# frozen_string_literal: true

require "test_helper"

module TNS
  class PaletteTest < Minitest::Test
    def test_tints_should_return_tints
      color = Color::RGB.new(255, 125, 0)
      result = Palette.new(color).tints.map(&:to_hex).map(&:to_s)
      expected = %w[ffe5cc ffcb99 ffb166 ff9733]

      assert_equal(expected, result)
    end

    def test_shades_should_return_shades
      color = Color::RGB.new(255, 125, 0)
      result = Palette.new(color).shades.map(&:to_hex).map(&:to_s)
      expected = %w[cc6400 994b00 663200 331900]

      assert_equal(expected, result)
    end

    def test_to_a_should_return_array_of_tints_and_shades
      result = Palette.new(Color::RGB.new(255, 125, 0)).to_a

      assert_equal(9, result.size)
    end
  end
end
