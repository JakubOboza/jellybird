module JellyBird

  module Generate

    def gen(opts = {}, &block)
      generate(:default, opts, &block)
    end

    def generate(name = :default, opts = {}, &block)
      options = self::generator(name).call if self::generator(name)
      options.merge!(opts)
      obj = self.new(options)
      options.each_pair { |key, value| obj[key] = value } if obj.kind_of?(Hash)
      yield(obj) if block_given?
      obj
    end

  end
end
