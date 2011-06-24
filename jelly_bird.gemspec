# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "jelly_bird/version"

Gem::Specification.new do |s|
  s.name        = "jelly_bird"
  s.version     = JellyBird::VERSION
  s.authors     = ["JO"]
  s.email       = ["jakub.oboza@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{TODO: Write a gem summary}
  s.description = %q{TODO: Write a gem description}

  s.rubyforge_project = "jelly_bird"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
