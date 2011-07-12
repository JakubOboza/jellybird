
module JellyBird

  module Define

    @@generator = {}

    def define(name = :default, &default_lambda)
      if @@generator[self.to_s]
        @@generator[self.to_s][name] = default_lambda
      else
        @@generator[self.to_s] = { name => default_lambda }
      end
    end

    def generator(name = :default)
      @@generator[self.to_s][name]
    end

  end

end
