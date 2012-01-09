# -*- encoding: utf-8 -*-
$:.unshift File.expand_path('../lib', __FILE__)
require 'priority_test/version'

Gem::Specification.new do |s|
  s.name        = "priority_test"
  s.version     = PriorityTest::VERSION
  s.authors     = ["Jingwen Owen Ou"]
  s.email       = ["jingweno@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Run tests in priority}
  s.description = %q{Run tests in priority}

  s.rubyforge_project = "priority_test"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency "sequel"
  s.add_runtime_dependency "sqlite3"

  s.add_development_dependency "rake"
  s.add_development_dependency "rspec"
  s.add_development_dependency "yard"
end
