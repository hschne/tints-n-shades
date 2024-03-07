# frozen_string_literal: true

require "test_helper"

# rubocop:disable Metrics/MethodLength
module TNS
  class PaletteTest < Minitest::Test
    def test_tints_should_return_tints
      color = Color::RGB.new(255, 125, 0)
      result = Palette.new(color).tints.map(&:to_hex).map(&:to_s)
      expected = %w[
        ff8a1a
        ff9733
        ffa44d
        ffb166
        ffbe80
        ffcb99
        ffd8b3
        ffe5cc
        fff2e6
      ]

      assert_equal(expected, result)
    end

    def test_shades_should_return_shades
      color = Color::RGB.new(255, 125, 0)
      result = Palette.new(color).shades.map(&:to_hex).map(&:to_s)
      expected = %w[
        e67100
        cc6400
        b35800
        994b00
        803f00
        663200
        4c2500
        331900
        190c00
      ]

      assert_equal(expected, result)
    end

    def test_to_a_should_return_array_of_tints_and_shades
      result = Palette.new(Color::RGB.new(255, 125, 0)).to_a

      assert_equal(19, result.size)
    end
  end
end
# rubocop:enable Metrics/MethodLength
