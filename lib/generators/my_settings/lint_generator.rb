module MySettings
  module Generators
    class LintGenerator < Rails::Generators::Base
      source_root File.expand_path(
        "../../templates/lints", __FILE__)

      desc "generate lint files"
      option :rubocop, aliases: "-R", desc: "Creating .rubocop.yml. Please install rubocop"
      option :scsslint, aliases: "-S", desc: "Create .scss-lint.yml. Please install scss-lint"


      def create_lint_files
        template ".editorconfig", ".editorconfig"
        template ".rubocop.yml", ".rubocop.yml" if options[:rubocop]
        template ".scss-lint.yml", ".scss-lint.yml" if options[:scsslint]
      end
    end
  end
end
