# frozen_string_literal: true

require "test_helper"
module TNS
  module Color
    class RGBTest < Minitest::Test
      def test_tint_should_return_tinted_rgb
        expected = Tint.new(RGB.new(255, 151, 51), 1)

        assert_equal(expected, RGB.new(255, 125, 0).tint(1))
      end

      def test_shade_should_return_shade
        expected = Shade.new(RGB.new(204, 100, 0), 1)

        assert_equal(expected, RGB.new(255, 125, 0).shade(1))
      end

      def test_from_hex_with_long_should_return_rgb
        expected = RGB.new(255, 125, 0)

        assert_equal(expected, RGB.from_hex("ff7d00"))
      end

      def test_from_hex_with_short_should_return_rgb
        expected = RGB.new(221, 119, 221)

        assert_equal(expected, RGB.from_hex("d7d"))
      end

      def test_from_hex_with_invalid_should_raise
        assert_raises(RGB.from_hex(""))
      end

      def test_to_hex_should_return_hex
        assert_equal("ff7d00", RGB.new(255, 125, 0).to_hex.to_s)
      end

      def test_to_css_should_return_css_string
        assert_equal("rgb(255 125 0)", RGB.new(255, 125, 0).to_css)
      end

      def test_to_s_should_return_rgb_string
        assert_equal("255 125 0", RGB.new(255, 125, 0).to_s)
      end
    end
  end
end
