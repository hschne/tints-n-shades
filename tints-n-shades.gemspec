# frozen_string_literal: true

require_relative "lib/tns/version"

Gem::Specification.new do |spec|
  spec.name = "tints-n-shades"
  spec.version = TNS::VERSION
  spec.authors = ["Hans Schnedlidtz"]
  spec.email = ["hans.schnedlitz@gmail.com"]

  spec.summary = "The tints & shades generator for CLI lovers."
  spec.description = "The tints & shades generator for CLI lovers. Generate in any format."
  spec.homepage = "https://github.com/hschne/tints-n-shades"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.2.2"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/hschne/tints-n-shades"
  spec.metadata["changelog_uri"] = "https://github.com/hschne/tints-n-shades/CHANGELOG.md"

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Uncomment to register a new dependency of your gem
  # spec.add_dependency "example-gem", "~> 1.0"

  # For more information and examples about making a new gem, check out our
  # guide at: https://bundler.io/guides/creating_gem.html
  spec.metadata["rubygems_mfa_required"] = "true"

  spec.add_dependency("thor", "~> 1.3")
end
