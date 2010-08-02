#init git for the app
apply "http://github.com/slavix/rails-templates/raw/rails3/newgit.rb"

if yes?("Do you want to use  jQuery?", true)
  apply "http://github.com/slavix/rails-templates/raw/rails3/jquery.rb"
end

if yes?("Do you want to use RSpec??")
  apply "http://github.com/slavix/rails-templates/raw/rails3/rspec.rb"
end

if yes?("Do you want to use cucumber?")
  apply "http://github.com/slavix/rails-templates/raw/rails3/cucumber.rb"
end

if yes?("Do you want to use active_scaffold?")
  apply "http://github.com/slavix/rails-templates/raw/rails3/active_scaffold.rb"
end

#generate :controller, "welcome index"
#route "map.root :controller => 'welcome'"

#commits all to git
apply "http://github.com/slavix/rails-templates/raw/rails3/git-commit.rb"
