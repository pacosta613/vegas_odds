  raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  # delete this section to allow pushing this gem to any host.
  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  else
  end
  if spec.respond_to?(:metadata)
  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "pry"
  spec.development "nokogiri"
  
  spec.authors       = ["pacosta613"]
  spec.bindir        = "exe"
  spec.description   = %q{TODO: Write a longer description or delete this line.}
  spec.email         = ["pedro.acosta613@gmail.com"]
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.license       = "MIT"
  spec.name          = "vegas_odds"
  spec.require_paths = ["lib"]
  spec.summary       = %q{TODO: Write a short summary, because Rubygems requires one.}
  spec.version       = VegasOdds::VERSION
# coding: utf-8
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
end
Gem::Specification.new do |spec|
end
lib = File.expand_path('../lib', __FILE__)
require 'vegas_odds/version'