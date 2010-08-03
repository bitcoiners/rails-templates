#adds rspec gems and generates rspec install
gem "rspec", "2.0.0.beta.19", :group => :test
gem "rspec-rails", "2.0.0.beta.19", :group => :test
generate("rspec:install")


inject_into_file "config/application.rb", 
                  "g.test_framework :rspec, :fixture => true, :views => false\n", 
                  :after => "class Application < Rails::Application\n"
