# factory_girl.rb
# from Slava Mikerin

gem "factory_girl", :group => :test


inject_into_file "config/application.rb", :after => "class Application < Rails::Application\n" do
  "\n\s\s\s\sconfig.generators do |g|
    \tg.fixture_replacement :factory_girl, :dir => \"spec/factories\"
  \s\send\n\n"
end