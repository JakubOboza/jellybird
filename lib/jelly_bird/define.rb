module JellyBird

  module Define

    @@generators = nil

    def define(&default_lambda)
      @@generator = default_lambda
    end

    def generator
      @@generator
    end

  end

end
