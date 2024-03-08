# frozen_string_literal: true

require "test_helper"

module TNS
  module Output
    class OutputTest < Minitest::Test
      def test_css_variable_returns_color_as_css_variable
        color = Color::Tint.new(Color::RGB.new(255, 125, 0), 0)

        assert_equal("--primary-500=rgb(255 125 0)", CSSVariable.new(color, "primary").to_s)
      end

      def test_sass_variable_returns_color_as_sass_variable
        color = Color::Tint.new(Color::RGB.new(255, 125, 0), 0)

        assert_equal("$primary-500=rgb(255 125 0)", SASSVariable.new(color, "primary").to_s)
      end

      def test_text_format_returns_palette_formatted
        color = Color::Tint.new(Color::RGB.new(255, 125, 0), 0)

        result = Text.new("primary", "css").format([color])

        assert_equal("--primary-500=rgb(255 125 0);", result)
      end
    end
  end
end
