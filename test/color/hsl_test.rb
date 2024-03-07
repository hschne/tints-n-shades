# frozen_string_literal: true

require "test_helper"

module TNS
  module Color
    class HSLTest < Minitest::Test
      def test_to_css_should_return_css_color
        assert_equal("hsl(29 100 50)", HSL.new(RGB.new(255, 125, 0)).to_css)
      end

      def test_to_s_should_return_raw_color
        assert_equal("29 100 50", HSL.new(RGB.new(255, 125, 0)).to_s)
      end
    end
  end
end
