module MySettings
  module Generators
    class LintGenerator < Rails::Generators::Base
      source_root File.expand_path(
        "../../templates/lints", __FILE__)

      desc "generate lint files"
      class_option :rubocop, aliases: "-R", desc: "Creating .rubocop.yml. Please install rubocop"
      class_option :scsslint, aliases: "-S", desc: "Create .scss-lint.yml. Please install scss-lint"

      def create_lint_files
        template ".editorconfig", ".editorconfig"
      end

      def create_rubocop
        if options[:rubocop]
          template ".rubocop.yml", ".rubocop.yml"
          gem "rubocop", group: :development if yes?("Would you like add rubocop to gemfile?")
        end
      end

      def create_scss_lint
        if options[:scsslint]
          template ".scss-lint.yml", ".scss-lint.yml"
          gem "scss_lint", group: :development if yes?("Would you like add scss_lint to gemfile?")
        end
      end
    end
  end
end
