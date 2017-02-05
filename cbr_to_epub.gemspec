# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cbr_to_epub/version'

Gem::Specification.new do |spec|
  spec.name          = 'cbr_to_epub'
  spec.version       = CbrToEpub::VERSION
  spec.authors       = ['Rafal Cymerys']
  spec.email         = ['rafal@latenightcoding.co']

  spec.summary       = %q{A simple gem for converting cbr files to epub}
  spec.homepage      = 'https://rubygems.org/gems/cbr_to_epub'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.13'
  spec.add_development_dependency 'rake', '~> 10.0'
end
