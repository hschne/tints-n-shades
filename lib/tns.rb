# frozen_string_literal: true

require_relative "tns/version"

require_relative "tns/color/base"
require_relative "tns/color/rgb"
require_relative "tns/color/hex"
require_relative "tns/color/hsl"

require_relative "tns/color/variant"
require_relative "tns/color/tint"
require_relative "tns/color/shade"
require_relative "tns/output/css_variable"
require_relative "tns/output/sass_variable"
require_relative "tns/output/json"
require_relative "tns/output/text"
require_relative "tns/palette"

module TNS
  class Error < StandardError; end
end
