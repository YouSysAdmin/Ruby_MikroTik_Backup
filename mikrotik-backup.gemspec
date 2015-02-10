# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'mikrotik-backup/version'

Gem::Specification.new do |spec|
  spec.name          = "mikrotik-backup"
  spec.version       = MikrotikBackup::VERSION
  spec.authors       = ["POS_troi"]
  spec.email         = ["root@sysalex.com"]
  spec.summary       = %q{Backup MikroTik configuration using SSH and SFTP.}
  spec.description   = %q{Backup MikroTik configuration using SSH and SFTP.}
  spec.homepage      = "https://sysalex.com"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_dependency "net-ssh", "~> 2.9"
  spec.add_dependency "net-sftp", "~> 2.1"
end