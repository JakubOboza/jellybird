module JellyBird

  module Generate

    def gen(opts = {})
      options = self::generator.call if self::generator
      options.merge!(opts)
      obj = self.new(options)
       options.each_pair { |key, value| obj[key] = value } if obj.kind_of?(Hash)
      obj
    end

  end
end
