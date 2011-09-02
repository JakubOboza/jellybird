require 'spec_helper'

class Mummy
  attr_accessor :attributes

  def initialize(opts = {})
    self.attributes = opts
  end

  def bandage
    self.attributes[:bandage] = true
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

    before(:all) do

      Dummy.define {{
        :name => /\w{3,8}/.gen,
        :number => /\d\d\d\d\d\d\d/.gen
      }}

    end

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

    it "should create object with other objects inside" do
      dummy = Dummy.gen({:bomb => {:size => 15, :purpose => "anti-personal", :type => {:name => "claymore", :category => ["land", "mine"] }}})
      dummy[:name].should_not be_nil
      dummy[:bomb][:type][:category][1].should eql("mine")
    end

   it "should generate object inside of other object" do
      dummy = Dummy.gen

      Rummy.define {{
          :baby_rummy_is_a => dummy
      }}

      mummy = Rummy.gen
      mummy[:baby_rummy_is_a][:name].should_not be_nil

     Rummy.define {{
       :baby => Dummy.gen,
       :name => /\w{3,6}/.gen
     }}

     Rummy.gen.should be_a(Rummy)
     Rummy.gen[:baby].should be_a(Dummy)
   end

   it "should not override other generators" do

      Rummy.define {{
          :aa => "Rummy"
      }}

      Dummy.define {{
          :bb => "Dummy"
      }}

      Rummy.gen[:aa].should eql("Rummy")

   end

   it "should be able to run bandage within gen " do
     mummy = Mummy.gen {|mummy| mummy.bandage }
     mummy.should be_kind_of(Mummy)
     mummy.attributes[:bandage].should be_true
   end

  end

end
