module JellyBird

  module Generate

    def gen(opts = {})
      generate(:default, opts)
    end

    def generate(name = :default, opts = {})
      options = self::generator(name).call if self::generator(name)
      options.merge!(opts)
      obj = self.new(options)
       options.each_pair { |key, value| obj[key] = value } if obj.kind_of?(Hash)
      obj
    end

  end
end
