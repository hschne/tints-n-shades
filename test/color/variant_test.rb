# frozen_string_literal: true

require "test_helper"

module TNS
  module Color
    class TestRGB < Minitest::Test
      def test_index_should_return_for_tint
        tint = Tint.new(RGB.new(255, 125, 0), 1)

        assert_equal(4, tint.index)
      end

      def test_index_should_return_for_shade
        shade = Shade.new(RGB.new(255, 125, 0), 1)

        assert_equal(6, shade.index)
      end
    end
  end
end
