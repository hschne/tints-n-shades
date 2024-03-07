# frozen_string_literal: true

require "test_helper"

module TNS
  class InputTest < Minitest::Test
    def test_named_colors_should_return_named_colors
      input = ["color:name"]
      expected = { "color" => "name" }

      assert_equal(expected, Input.named_colors(input))
    end

    def test_named_colors_should_return_nominal_names
      input = %w[color1 color2]
      expected = {
        "color1" => "primary",
        "color2" => "secondary"
      }

      assert_equal(expected, Input.named_colors(input))
    end
  end
end
