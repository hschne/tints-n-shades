# frozen_string_literal: true

require_relative "lib/tns/version"

Gem::Specification.new do |spec|
  spec.name = "tints-n-shades"
  spec.version = TNS::VERSION
  spec.authors = ["Hans Schnedlidtz"]
  spec.email = ["hello@hansschnedlitz.com"]

  spec.summary = "The tints & shades generator for CLI lovers."
  spec.description = "The tints & shades generator for CLI lovers."
  spec.homepage = "https://github.com/hschne/tints-n-shades"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 3.2.2"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/hschne/tints-n-shades"
  spec.metadata["changelog_uri"] = "https://github.com/hschne/tints-n-shades/CHANGELOG.md"

  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.metadata["rubygems_mfa_required"] = "true"

  spec.add_dependency("thor", "~> 1.3")
end
