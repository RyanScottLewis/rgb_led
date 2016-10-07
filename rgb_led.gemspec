# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rgb_led/version'

Gem::Specification.new do |spec|
  spec.name          = "rgb_led"
  spec.version       = RGBLED::VERSION
  spec.authors       = ["Ryan Scott Lewis"]
  spec.email         = ["ryanscottlewis@gmail.com"]

  spec.summary       = "REG LED controller"
  spec.description   = "A controller for RGB LED using Arduino"
  spec.homepage      = "https://github.com/RyanScottLewis/rgb_led"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "pry", "0.10.4"

  spec.add_development_dependency "bundler", "~> 1.12"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
