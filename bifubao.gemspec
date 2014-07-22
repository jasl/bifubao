lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'bifubao/version'

Gem::Specification.new do |spec|
  spec.name          = "bifubao"
  spec.version       = Bifubao::VERSION
  spec.authors       = ["Jasl"]
  spec.email         = ["jasl9187@hotmail.com"]
  spec.description   = %q{An unofficial bifubao ruby gem}
  spec.summary       = %q{An unofficial bifubao ruby gem}
  spec.homepage      = "https://github.com/jasl/bifubao"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "rest-client", "~> 1"

  spec.add_development_dependency "bundler"
  spec.add_development_dependency "rake"
end
