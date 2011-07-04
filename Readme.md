# Jelly Bird gem

# instalation

type
    gem install jelly_bird

or add to bundler ( test group )

    "jelly_bird", :git => "git@github.com:JakubOboza/jellybird.git"

# usage

assuming you have class called `Dummy` with two properties name and number you can create test factory this say:

          Dummy.define {{
            :name => /\w{3,8}/.gen,
            :number => /\d\d\d\d\d\d/.gen
          }}

to generate object in test just use `.gen` like this `Dummy.gen` to get generated object

# example

    class Dummy < Hash; end

    Dummy.define {{
      :name => /\w{3,10}/.gen
    }}

    10.times { puts Dummy.gen[:name] }

    dummy = Dummy.gen
    puts dummy[:name]