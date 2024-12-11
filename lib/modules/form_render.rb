# frozen_string_literal: true

module HexletCode
  # FormRenderer for rendering our form
  class FormRenderer
    require 'active_support/all'
    def initialize(form)
      @our_form = form
    end

    def build_html
      form = @our_form.form_data
      inputs_as_html = build_inputs(form[:inputs])
      submit = HexletCode::Tag.build('input', form[:submit][:options]) unless form[:submit][:options].nil?
      HexletCode::Tag.build('form', form[:form_options]) { "#{inputs_as_html}#{submit}" }
    end

    def build_inputs(inputs)
      inputs.map do |input|
        input_type = input[:type] == :input ? 'String' : input[:type].capitalize
        input_class = "HexletCode::Inputs::#{input_type}Input".constantize
        input_class.build(input[:options], input[:value])

        # new_input = create_string_input(input[:options], input[:value]) if input[:type] == :input
        # new_input = create_text_input(input[:options], input[:value]) if input[:type] == :text
        # new_input
      end.join
    end

    # def create_string_input(options, value)
    #   options[:type] = 'text'
    #   options[:value] = value
    #   label = HexletCode::Tag.build('label', { for: options[:name] }) { options[:name].capitalize }
    #   input = HexletCode::Tag.build('input', options)
    #   label + input
    # end

    # def create_text_input(options, value)
    #   cols = options[:cols] ||= 20
    #   rows = options[:rows] ||= 40
    #   label = HexletCode::Tag.build('label', { for: options[:name] }) { options[:name].capitalize }
    #   input = HexletCode::Tag.build('textarea', { cols: cols, rows: rows }.merge(options)) { value }
    #   label + input
    # end
  end
end
