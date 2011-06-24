module JellyBird

  module Generate

    def gen(opts = {})
      options = self::generator.call if self::generator
      options.merge!(opts)
      self.new(options)
    end

  end

end
