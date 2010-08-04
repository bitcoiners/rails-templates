# rspec.rb
# from Slava Mikerin

#adds rspec gems and generates rspec install
gem "rspec", ">= 2.0.0.beta.19", :group => :test
gem "rspec-rails", ">= 2.0.0.beta.19", :group => :test
generate("rspec:install")

inject_into_file "config/application.rb", :after => "class Application < Rails::Application\n" do
  "\n\s\s\s\sconfig.generators do |g|
    \tg.test_framework :rspec, :fixture => true, :views => true
  \s\send\n\n"
end