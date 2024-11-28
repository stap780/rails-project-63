# frozen_string_literal: true

require_relative "hexlet_code/version"

module HexletCode
  class Error < StandardError; end
  # Your code goes here...
  autoload(:Tag, "./lib/modules/tag.rb")

  def self.form_for( object, options = {} )
    action = options[:url].nil? ? "action='#'" : "action='#{options[:url]}'"
    block = block_given? ? yield : ''
    other_options = options.except(:url).map{|k,v| " #{k}='#{v}'"}.join(' ')
    "<form #{action} method='post'#{other_options}>#{block}</form>"
  end

end
