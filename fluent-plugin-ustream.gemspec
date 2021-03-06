# coding: utf-8
lib = File.expand_path('../lib', __FILE__)

Gem::Specification.new do |spec|
  spec.name          = "fluent-plugin-ustream"
  spec.version       = "0.0.1"
  spec.authors       = ["yuiseki"]
  spec.email         = ["yuiseki@gmail.com"]
  spec.description   = %q{fluentd plugin of inputs from ustream data api}
  spec.summary       = %q{fluentd plugin of inputs from ustream data api}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "fluentd"
  spec.add_runtime_dependency "fluentd"
end
