#based on buddhamagnet.rb from Dave Goodchild http://flavors.me/buddhamagnet

puts "removing unnecessary files"

run "rm public/index.html"
run "rm public/favicon.ico"
run "rm public/robots.txt"

puts "copying database.yml and adding .gitinclude files"

run "cp config/database.yml config/database.yml.example"

=begin
if yes?("Do you want an .rvmrc file?")
  ruby_version = ask("what version of ruby do you want in the .rvmrc file?")
  file '.rvmrc', <<RVM
ruby-#{ruby_version}
RVM
end
=end
r
puts "adding top-level .gitignore file"

#run %{find . -type d -empty | grep -v "vendor" | grep -v "log" | grep -v ".git" | grep -v "tmp" | xargs -I xxx touch xxx/.gitignore}
run "rm .gitignore"
file '.gitignore', <<-IGNORE
\#*
**/*.db
**/*.log
*~
.#*
.DS_Store
.bundle
.idea
.loadpath
.project
public/dispatch.cgi
public/dispatch.fcgi
public/dispatch.rb
config/database.yml
db/*.sql
db/*.sqlite3*
db/schema.rb
doc/**/*
*/Gemfile
*/Gemfile.lock
log/*.log
public/assets
public/attachments
**/spec/dummy
tmp
vendor/rails
coverage/*
test_app
.rvmrc
**/coverage
.sass-cache
IGNORE

def sanitize_gem(gem, test = false)
  $gem_name = gem.split('-').first
  eval("#{$gem_name}_set = true")
  if test
    gem "#{gem}", :group => [:development, :test]
  else
    gem "#{gem}"
  end
end

puts "configuring gems"
gem 'json'

%w[rails devise cancan jquery-rails haml-rails admin_data spree capistrano].each do |gem|
  if gem != 'rails' and yes?("do you want the #{gem} gem? (y/n) ")
    sanitize_gem(gem)
  end
end

puts "configuring test environment"

%w[rspec-rails cucumber-rails webrat capybara mocha rcov faker shoulda database_cleaner factory_girl].each do |gem|
  if yes?("TESTING TOOLS: do you want the #{gem} gem? (y/n) ")
    sanitize_gem(gem, true)
  end
end

# Gems used only for assets and not required
# in production environments by default.
gem 'sass-rails', "~> 3.1.0.rc", :group => [:assets]
gem 'coffee-rails', "~> 3.1.0.rc", :group => [:assets]
gem 'uglifier', :group => [:assets]
#
#group :development, :test do
#  gem 'factory_girl_rails'
#  gem 'launchy'
#
#  if RUBY_VERSION < "1.9"
#    gem "ruby-debug"
#  else
#    gem "ruby-debug19"
#  end
#end


puts "running bundler"

run('bundle install')

puts "running generators"

generate('rspec:install') unless !$rspec_set
generate('cucumber:install') unless !$cucumber_set
generate('cancan:install') unless !$cancan_set

if $devise_set
  generate('devise:install')
  model_name = ask("What would you like the user model to be called? [user]")
  model_name = "user" if model_name.blank?
  generate("devise", model_name)
  generate('devise:views')
end

puts "migrating..."
rake('db:migrate')

#generate('jquery:install -ui') unless !$jquery_set


if yes?("want to a create capistrano configuration?")
  run "capify ."
end

puts "initialising git repo and committing filesfiles"
git :init
git :add => '.'
git :commit => "-a -m 'Initial commit'"

=begin
if yes?("want to create a heroku application?")
  heroku_app = ask("what do you want to call it?")
  run("heroku create --cedar #{heroku_app}")

  #group :production do
  #  gem 'pg'
  #end

  # config/unicorn.rb

  #worker_processes 4 # amount of unicorn workers to spin up
  #timeout 30         # restarts workers that hang for 30 seconds

  #Rails.root/Procfile
  #
  #web: bundle exec unicorn -p $PORT -c ./config/unicorn.rb


  #config/s3.yml and modify the key in accordance to your S3 account
  #
  #development:
  #  bucket: your_app_dev
  #  access_key_id: your_access_key
  #  secret_access_key: secret_access_key
  #
  #test:
  #  bucket: your_app_test
  #  access_key_id: your_access_key
  #  secret_access_key: secret_access_key
  #
  #production:
  #  bucket: your_app_prod
  #  access_key_id: your_access_key
  #  secret_access_key: secret_access_key

end

=end
#gem 'unicorn'

#puts "#{@root.split('/').last} created. Proceed to rock and roll."