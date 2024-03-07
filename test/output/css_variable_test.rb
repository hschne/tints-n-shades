# frozen_string_literal: true

require "test_helper"

module TNS
  module Output
    class CSSVariableTest < Minitest::Test
      def test_to_s_returns_color_as_css_variable
        color = Color::Tint.new(Color::RGB.new(255, 125, 0), 0)

        assert_equal("--color-primary-500=rgb(255 125 0)", CSSVariable.new(color, "primary").to_s)
      end
    end
  end
end
