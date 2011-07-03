module JellyBird

  module Define

    @@generator = {}

    def define(&default_lambda)
      @@generator[self.to_s] = default_lambda
    end

    def generator
      @@generator[self.to_s]
    end

  end

end
