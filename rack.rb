# rack.rb
# template to setup a set of rack middlewares
# from Slava Mikerin

if yes?("Do you want to use  Rack: google_analytics")
  gem "ambethia-rack-google_analytics", 
    :lib => "rack/google_analytics", 
    :source => "http://gems.github.com"
  inject_into_file "config.ru", :before => "require" do
    google_id = ask "enter your Google Analitycs UA-XXXXX number" || "UA-0000000-1"
    'use Rack::GoogleAnalytics, :web_property_id => ' + google_id
  end                  
end

#sets custom headers for each HTML5 feature the browser supports
if yes?("Do you want to use  Rack: rack-html5")
  gem 'rack-html5'  
  inject_into_file "config.ru", :before => "require" do
    "\nuse Rack::Html5\n"
  end
end

if yes?("Do you want to use  Rack: rack-tidy")
  gem 'rack-tidy', :require => 'rack/tidy'
  inject_into_file "config.ru", :before => "require" do
    "\nuse Rack::Tidy\n"
  end
end