# frozen_string_literal: true
module HexletCode
  # Tag for form
  class Tag
    def self.build(tag, options = {})
      extra = options.map{ |k, v| "#{k}='#{v}'" }.join(' ')
      tag_name = tag.to_s.downcase
      if tag_name == 'input'
        "<#{tag_name} #{extra}>"
      else
        "<#{tag_name} #{extra}>#{yield if block_given?}</#{tag_name}>"
      end
    end
  end
end