require "randexp"
require "jelly_bird/version"
require "jelly_bird/gen"
require "jelly_bird/define"

module JellyBird

  def self.included(base)
    base.extend( JellyBird::Generate )
    base.extend( JellyBird::Define )
  end

end
