# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rails/froutes/version'

Gem::Specification.new do |spec|
  spec.name          = "rails-froutes"
  spec.version       = Rails::Froutes::VERSION
  spec.authors       = ["pinzolo"]
  spec.email         = ["pinzolo@gmail.com"]
  spec.summary       = %q{Fill name on routes task}
  spec.description   = %q{This gem fills route name displayed by `rake routes` task.}
  spec.homepage      = "https://github.com/pinzolo/rails-froutes"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency 'rails', '>= 3.2.0'

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end
