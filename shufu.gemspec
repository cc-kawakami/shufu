# frozen_string_literal: true

require_relative "lib/shufu/version"

Gem::Specification.new do |spec|
  spec.name = "shufu"
  spec.version = Shufu::VERSION
  spec.authors = ["cc-kawakami"]
  spec.email = ["kawakami-moeki@colorfulcompany.co.jp"]

  spec.summary = "Shufu is a simple command line generator"
  spec.description = "Shufu is a simple command line generator"
  spec.homepage = "https://github.com/cc-kawakami/shufu"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/cc-kawakami/shufu"
  spec.metadata["changelog_uri"] = "https://github.com/cc-kawakami/shufu"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      (f == __FILE__) || f.match(%r{\A(?:(?:test|spec|features)/|\.(?:git|travis|circleci)|appveyor)})
    end
  end
  spec.require_paths = ["lib"]

  spec.add_dependency "dry-schema"
  spec.add_dependency "dry-initializer"
end
