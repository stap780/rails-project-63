module HexletCode
  # Tag for form
  class Tag

    def self.build(tag, options = {})
      extra = options.map{|k,v| "#{k}='#{v}'"}.join(' ')
      # block = block_given? ? yield : ''
      # array = tag == 'img' || tag == 'input' ? ['<',tag, extra,'>'] : ['<',tag, extra,'>', block,'</', tag,'>']
      # array.join()
      tag_name = tag.to_s.downcase
      if tag_name == 'input'
        "<#{tag_name} #{extra}>"
      else
        "<#{tag_name} #{extra}>#{yield if block_given?}</#{tag_name}>"
      end
    end

  end
end