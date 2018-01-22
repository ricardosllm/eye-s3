# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'eye/notify/eye_s3/version'

Gem::Specification.new do |spec|
  spec.name          = "eye-s3"
  spec.version       = Eye::Notify::EyeS3::VERSION
  spec.authors       = ["Ricardo Mota"]
  spec.email         = ["ricardo@mota.cloud"]
  spec.summary       = %q{eye to s3 object}
  spec.description   = %q{eye to s3 object}
  spec.homepage      = "https://github.com/ricardosllm/eye-s3"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_runtime_dependency "aws-sdk", "~ 3"
  spec.add_runtime_dependency "eye", ">= 0.9"
end
