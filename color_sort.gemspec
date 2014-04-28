# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'color_sort/version'

Gem::Specification.new do |spec|
  spec.name          = "color_sort"
  spec.version       = ColorSort::VERSION
  spec.authors       = ["Pip Taylor"]
  spec.email         = ["pip@evilgeek.co.uk"]
  spec.summary       = %q{Sorts colors perceptually}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "colorscore"
  spec.add_dependency "color"

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "rspec-radar"
end
