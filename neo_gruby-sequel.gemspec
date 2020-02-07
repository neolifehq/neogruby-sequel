require_relative 'lib/neo_gruby/sequel/version'

Gem::Specification.new do |spec|
  spec.name          = "neo_gruby-sequel"
  spec.version       = NeoGruby::Sequel::VERSION
  spec.authors       = ["Welington Sampaio"]
  spec.email         = ["welington.sampaio@icloud.com"]

  spec.summary       = %q{Implement Sequel routines to works with NeoGruby Framework}
  # spec.description   = %q{}
  spec.homepage      = "https://github.com/neolifehq/neogruby-sequel"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.3.0")

  # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/neolifehq/neogruby-sequel.git"
  # spec.metadata["changelog_uri"] = "TODO: Put your gem's CHANGELOG.md URL here."

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir['lib/**/*.rb', 'exe/*']
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]
  
  spec.add_dependency 'neo_gruby', '~> 0.2.0'
  spec.add_dependency 'sequel', '~> 4.49.0'
  spec.add_dependency 'uuidtools', '~> 2.1.5'
end
