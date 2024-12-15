# frozen_string_literal: true

module HexletCode
  # FormRenderer for rendering our form
  class FormRenderer
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
      end.join
    end
  end
end
