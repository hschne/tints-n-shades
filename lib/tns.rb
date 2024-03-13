# frozen_string_literal: true

require_relative "tns/version"

require_relative "tns/color/base"
require_relative "tns/color/rgb"
require_relative "tns/color/hex"
require_relative "tns/color/hsl"

require_relative "tns/color/variant"
require_relative "tns/color/tint"
require_relative "tns/color/shade"
require_relative "tns/output/output"
require_relative "tns/output/css"
require_relative "tns/output/sass"
require_relative "tns/output/tailwind"
require_relative "tns/palette"

module TNS
  class Error < StandardError; end
end
