# slavix_default.rb
# from Slava Mikerin

#init git for the app
apply "http://github.com/slavix/rails-templates/raw/rails3/newgit.rb"

run "echo TODO > README"
run "rm public/index.html"



#default set of included gems
gem 'inherited_resources', '>= 1.1.2'

if yes?("Do you want to use Formtastic?")
  gem 'formtastic', :git => "http://github.com/justinfrench/formtastic.git", :branch => "rails3"
  gem install jintastic 
  run "bundle install"
  generate("formtastic:install")
end

if yes?("Do you want to use Devise?")
  gem 'devise', '>= 1.1.3'
end


#adds Generators for DataMapper, Haml, Factory-girl, Authlogic, Mongomapper, Shoulda, Formtastic and SimpleForm
gem 'rails3-generators', :group => :development
#more generators
gem "nifty-generators", :group => :development

apply "http://github.com/slavix/rails-templates/raw/rails3/rack.rb"

if yes?("Do you want to use  jQuery?")
  apply "http://github.com/slavix/rails-templates/raw/rails3/jquery.rb"
end

if yes?("Do you want to use RSpec?")
  apply "http://github.com/slavix/rails-templates/raw/rails3/rspec.rb"
end

if yes?("Do you want to use haml?")
  apply "http://github.com/slavix/rails-templates/raw/rails3/haml.rb"
end

if yes?("Do you want to use factory_girl?")
  apply "http://github.com/slavix/rails-templates/raw/rails3/factory_girl.rb"
end


if yes?("Do you want to use Cucumber?")
  apply "http://github.com/slavix/rails-templates/raw/rails3/cucumber.rb"
end

if yes?("Do you want to use active_scaffold?")
  apply "http://github.com/slavix/rails-templates/raw/rails3/active_scaffold.rb"
end


#commits all to git
git :add => "."
git :commit => "-a -m 'Setting up a new rails app.'"
