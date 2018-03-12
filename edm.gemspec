# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'regres/version'

Gem::Specification.new do |spec|
  spec.name          = "regres"
  spec.version       = Regres::VERSION
  spec.authors       = ["Peter Cooper"]
  spec.email         = ["git@peterc.org"]

  spec.summary       = %q{An easy schemaless key/value store based on Postgres.}
  spec.homepage      = "https://github.com/peterc/regres"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.14"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "minitest", "~> 5.0"

  spec.add_dependency "pg", "~> 1.0.0"
end
