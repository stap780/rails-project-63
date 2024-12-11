# frozen_string_literal: true

module HexletCode
  module Inputs
    autoload(:BaseInput, "#{__dir__}/inputs/base_input.rb")
    autoload(:StringInput, "#{__dir__}/inputs/string_input.rb")
    autoload(:TextInput, "#{__dir__}/inputs/text_input.rb")
  end
end
