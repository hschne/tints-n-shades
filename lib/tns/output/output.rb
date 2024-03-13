# frozen_string_literal: true

module TNS
  # Contains various output options.
  module Output
    def from_argument(arg, name)
      case arg
      when "css"
        CSS.new(name)
      when "sass"
        SASS.new(name)
      when "tailwind"
        Tailwind.new(name)
      else
        raise ArgumentError, "Invalid output #{arg}."
      end
    end
    module_function :from_argument
  end
end
