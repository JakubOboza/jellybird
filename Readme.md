# Jelly Bird gem

# instalation

type
     `gem install jelly_bird`

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
    # dummy[:name] => random generated /\w{3,10}/ compilant word

    other_dummy = Dummy.gen(:name => "dummy name")
    # other_dummy[:name] => "dummy name"

# custom factories
you can define custom factories, and generate object using `.generate` mwthod with factory name like this.

    Mummy.define {{
      :left  => /\w{3,10}/.gen,
      :right => /\w{3,10}/.gen
    }}

    Mummy.define(:custom) {{
      :center => /\w{3,10}/.gen
    }}

    mummy = Mummy.generate(:custom, :mumble => true)

in fact `.gen` is just calling generate with `:default` symbol.

# integration with rspec

touch a file with defines like `factories.rb` in spec folder and then require it inside of your `spec_helper.rb`. Then define all the factories like this.


User.define {{
  :first_name => /\w{3,9}/.gen,
  :last_name  => /\w{3,8}/.gen,
  :email      => /\w{3,8}@\w{3,8}\.com/.gen
}}

Family.define {{
  :father      => User.gen,
  :mom         => User.gen,
  :kind        => USer.gen,
  :family_name => /\w{3,8}/.gen
}}


remember that if you wanna embbed one into another please don't specify them at random order :).

Now just use it in tests!

# Changlelog

0.0.6 - Added ability for `.gen` and `.generate` to take blocks which receives object to make things aka `save`
0.0.5 - Fixed bugs
0.0.4 - Yanked version
0.0.1 -> 0.0.3 - Initial release

# Powered by
  It is powered by `randexp` gem and initial concept was based on `dm-sweatshop` syntax. Big thanks to this two projects.


# Author
  Jakub Oboza, https://github.com/JakubOboza