# haml.rb
# sets haml as template engine
# from Slava Mikerin

gem "haml"

inject_into_file "config/application.rb", :after => "class Application < Rails::Application\n" do
  "\n\s\s\s\sconfig.generators do |g|
    \tg.template_engine :haml
  \s\send\n\n"
end