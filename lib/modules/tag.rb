module HexletCode
  class Tag

    def self.build(tag, options = {})
      extra = options.map{|k,v| " #{k}='#{v}'"}.join(' ')
      block = block_given? ? yield : ''
      array = tag == 'img' || tag == 'input' ? ['<',tag, extra,'>'] : ['<',tag, extra,'>', block,'</', tag,'>']
      array.join()
    end

  end
end