# frozen_string_literal: true

module HexletCode
  module Inputs
    # Base class for all inputs
    class BaseInput
      def self.label(name)
        HexletCode::Tag.build('label', { for: name }) { name.capitalize }
      end
    end
  end
end
