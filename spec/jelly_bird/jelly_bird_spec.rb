require 'spec_helper'

class Mummy
  attr_accessor :attributes

  def initialize(opts = {})
    self.attributes = opts
  end

end

class Dummy < Hash; end

class Rummy < Hash; end

describe JellyBird do

  describe "#define_scheme" do

    it "should be able to define scheme for activerecord like objects" do

      Mummy.define {{
        :name => /\w{3,8}/.gen,
        :number => /\d\d\d\d\d\d/.gen
      }}
      mummy = Mummy.gen
      mummy.should be_kind_of(Mummy)
      mummy.attributes[:name].should =~ /\w{3,8}/
      mummy.attributes[:number].should =~ /\d\d\d\d\d\d/

    end

    it "should be able to define scheme for hashlike objects" do

      Dummy.define {{
        :name => /\w{3,8}/.gen,
        :number => /\d\d\d\d\d\d/.gen
      }}

      Rummy.define {{
        :name => /\w{3,8}/.gen,
        :number => /\d\d\d\d\d\d/.gen
      }}

      dummy = Dummy.gen
      dummy.should be_kind_of(Dummy)
      dummy[:name].should =~ /\w{3,8}/
      dummy[:number].should =~ /\d\d\d\d\d\d/

      rummy = Rummy.gen
      rummy.should be_kind_of(Rummy)
      rummy[:name].should =~ /\w{3,8}/
      rummy[:number].should =~ /\d\d\d\d\d\d/

    end

  end


  describe "#gen" do

    it "should be able to generate object" do
      dummy = Dummy.gen( :name => "test" )
      dummy.should be_kind_of(Dummy)
      dummy[:name].should eql("test")
    end

    it "should not generate same name" do
      500.times do
        Dummy.gen[:name].should_not eql(Dummy.gen[:name])
      end
    end

  end

end
