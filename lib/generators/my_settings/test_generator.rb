module MySettings
  module Generators
    class TestGenerator < Rails::Generators::Base
      public_command :add_test_settings

      desc "generate test setting"
      def add_test_settings
        if yes?("Would you like to use rspec?")
          setting_rspec
        else
          setting_minitest
        end

        gem "database_rewinder", group: :test

        run "bundle"
      end

      private

      def setting_rspec
        gem "rspec-rails", "~> 3.5", group: [:development, :test]
        run "bundle"
        rails_command "g rspec:install"

        if yes?("Would you like to use factory girl?")
          gem "factory_girl_rails", group: [:development, :test]
          create_file "spec/support/factory_girl.rb", <<~EOF
            RSpec.configure do |config|
              config.include FactoryGirl::Syntax::Methods
            end
          EOF
          insert_into_file "spec/rails_helper.rb", after: "require 'rspec/rails'" do
            <<~EOF
              \n
                require 'support/factory_girl'
            EOF
          end
        end

        insert_into_file "spec/rails_helper.rb", after: "RSpec.configure do |config|" do
          <<~EOF
            \n
              DatabaseRewinder.strategy = :transaction

              # Database Rewinder
              config.before(:suite) do
                DatabaseRewinder.clean_all
              end

              config.after(:each) do
                DatabaseRewinder.clean
              end
          EOF
        end
      end

      def setting_minitest
        if yes?("Would you like to use factory girl?")
          gem "factory_girl_rails", group: [:development, :test]
          insert_into_file "test/test_helper.rb", after: "class ActiveSupport::TestCase" do
            <<~EOF
              \n
                include FactoryGirl::Syntax::Methods
            EOF
          end
        end

        insert_into_file "test/test_helper.rb", after: "fixtures :all" do
          <<~EOF
            \n
              DatabaseRewinder.strategy = :transcation
              setup { DatabaseRewinder.clean }
          EOF
        end
      end
    end
  end
end