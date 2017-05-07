module MySettings
  module Generators
    class ConfigGenerator < Rails::Generators::Base
      source_root File.expand_path(
        "../../templates/configs", __FILE__)

      desc "generate config files"
      def create_config_files
        template ".ruby-version", ".ruby-version"
      end

      def add_gems
        if yes?("Would you like to use pry as debugger")
          gem "pry-byebug", group: [:development, :test]
          gem "pry-doc", group: [:development, :test]
          gem "pry-rails", group: [:development, :test]
          gem "pry-remote", group: [:development, :test]
        end

        gem "better_errors", group: [:development, :test]
        gem "dotenv-rails", group: [:development, :test]
        gem "bullet", group: :development

        # setting for bullet
        environment(nil, env: "development") do
          <<~EOF
            \n
              config.after_initialize do
                Bullet.enable = true
                Bullet.add_footer = true
                Bullet.bullet_logger = true
                Bullet.console = true
                Bullet.alert = true
              end
          EOF
        end

        run "bundle"
      end
    end
  end
end
