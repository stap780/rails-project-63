# frozen_string_literal: true

module HexletCode
  # FormBuilder for building form elements
  class FormBuilder
    attr_reader :form_data, :object

    def initialize(object, options)
      @object = object
      action = options.fetch(:url, '#')
      method = options.fetch(:method, 'post')

      @form_data = {
        inputs: [],
        form_options: { action: action, method: method}.merge(options.except(:url, :method))
      }
    end

    def input(name, input_options = {})
      raise NoMethodError, "undefined method `#{name}' for #{@object}" unless @object.respond_to?(name)

      value = @object.public_send(name)
      type = input_options.delete(:as) || :input
      input_options[:name] = name
      @form_data[:inputs] << { value: value, type: type, options: input_options}
    end

  end
end