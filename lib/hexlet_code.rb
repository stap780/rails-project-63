# frozen_string_literal: true

require_relative 'hexlet_code/version'

module HexletCode
  class Error < StandardError; end
  # Your code goes here...
  autoload(:Tag, "#{__dir__}/modules/tag.rb")
  autoload(:FormBuilder, "#{__dir__}/modules/form_builder.rb")
  autoload(:FormRenderer, "#{__dir__}/modules/form_render.rb")

  def self.form_for(object, options = {})
    form = HexletCode::FormBuilder.new(object, options)
    yield(form) if block_given?
    HexletCode::FormRenderer.new(form).build_html
  end
end
