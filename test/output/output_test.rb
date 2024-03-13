# frozen_string_literal: true

require "test_helper"

module TNS
  module Output
    class OutputTest < Minitest::Test
      def test_css_returns_sass_output
        output = Output.from_argument("css", "primary")

        palette = [Color::Tint.new(Color::RGB.new(255, 125, 0), 0)]
        result = output.format(palette)

        expected = "--primary-500: rgb(255 125 0);"

        assert_equal(expected, result)
      end

      def test_sass_returns_sass_output
        output = Output.from_argument("sass", "primary")

        palette = [Color::Tint.new(Color::RGB.new(255, 125, 0), 0)]
        result = output.format(palette)

        expected = "$primary-500: rgb(255 125 0);"

        assert_equal(expected, result)
      end

      def test_tailwind_returns_tailwind_output
        output = Output.from_argument("tailwind", "primary")

        palette = [Color::Tint.new(Color::RGB.new(255, 125, 0), 0)]
        result = output.format(palette)

        expected = JSON.pretty_generate({ "primary" => { "500" => "rgb(255 125 0)" } })

        assert_equal(expected, result)
      end
    end
  end
end
