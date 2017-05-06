module MySettings
  module Generators
    class LintGenerator < Rails::Generators::Base
      source_root File.expand_path(
        "../../templates/configs", __FILE__)

      desc "generate config files"
      def create_config_files
        template ".ruby-version", ".ruby-version"
      end
    end
  end
end
