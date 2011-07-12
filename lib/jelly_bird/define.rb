module JellyBird

  module Define

    @@generator = {}

    def define(name = :default, &default_lambda)
      @@generator[self.to_s] = { name => default_lambda }
    end

    def generator(name = :default)
      @@generator[self.to_s][name]
    end

  end

end
