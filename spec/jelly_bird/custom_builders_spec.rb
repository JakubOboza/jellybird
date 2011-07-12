require 'spec_helper'

class Mummy
  attr_accessor :attributes

  def initialize(opts = {})
    self.attributes = opts
  end

end

class Dummy < Hash; end

class Rummy < Hash; end

describe "Custom Builders" do

  it "should be able to define custom builders" do

    Mummy.define {{
      :left  => /\w{3,10}/.gen,
      :right => /\w{3,10}/.gen
    }}

    Mummy.define(:custom) {{
      :center => /\w{3,10}/.gen
    }}

    mummy = Mummy.generate(:custom, :mumble => true)
    mummy.attributes[:center].should_not be_nil
    mummy.attributes[:mumble].should eql(true)

  end

end
