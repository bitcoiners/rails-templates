#adds rspec gems and generates rspec install
gem "rspec", "2.0.0.beta.19", :group => :test
gem "rspec-rails", "2.0.0.beta.19", :group => :test
generate("rspec:install")
