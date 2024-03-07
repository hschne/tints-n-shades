# frozen_string_literal: true

module TNS
  module Color
    # Base color class
    class Base
      def to_css
        raise NotImplementedError
      end

      def to_s
        raise NotImplementedError
      end

      def ==(other)
        other.class == self.class && other.state == state
      end

      def state
        instance_variables.map { |variable| instance_variable_get variable }
      end
    end
  end
end
