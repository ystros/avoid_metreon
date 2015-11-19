# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'avoid_metreon/version'

Gem::Specification.new do |spec|
  spec.name          = 'avoid_metreon'
  spec.version       = AvoidMetreon::VERSION
  spec.authors       = ['Brian Upton']
  spec.email         = ['ystros@gmail.com']

  spec.summary       = 'Avoid Metreon generator'
  spec.description   = 'Generates a simple page that says whether there is a conference going on at Moscone Center and therefore you should avoid the Metreon / Yerba Buena area.'
  spec.homepage      = "TODO: Put your gem's website or public repo URL here."
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org by setting 'allowed_push_host', or
  # delete this section to allow pushing this gem to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency 'sass'
  spec.add_dependency 'wombat', '~> 2.4.0'
  spec.add_dependency 'haml', '~> 4.0.7'
end
