# frozen_string_literal: true

module HexletCode
  # FormRenderer for rendering our form
  class FormRenderer
    def initialize(form)
      @our_form = form
    end

    def build_html
      form = @our_form.form_data
      # puts "form[:inputs] => #{form[:inputs]}"
      inputs_as_html = build_inputs(form[:inputs])
      # puts "inputs_as_html => #{inputs_as_html}"
      HexletCode::Tag.build('form', form[:form_options]) { inputs_as_html }
    end

    def build_inputs(inputs)
      inputs.map do |input|
        # puts "input => #{input}"
        new_input = create_string_input(input[:options], input[:value]) if input[:type] == :input
        new_input = create_text_input(input[:options], input[:value]) if input[:type] == :text
        # puts "new_input => #{new_input}"
        new_input
      end.join
    end

    def create_string_input(options, value)
      options[:type] = 'text'
      options[:value] = value
      HexletCode::Tag.build('input', options)
    end

    def create_text_input(options, value)
      cols = options[:cols] ||= 20
      rows = options[:rows] ||= 40
      HexletCode::Tag.build('textarea', { cols: cols, rows: rows }.merge(options)) { value }
    end

  end
end