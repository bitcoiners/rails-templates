#adds cucumber gems and generates install
gem 'cucumber-rails', :group => :cucumber
#webrat alternative which aims to support all browser simulators
gem 'capybara', :group => :cucumber 
generate("cucumber:install")
