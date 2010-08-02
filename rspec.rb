#adds rspec gems and generates rspec install
group :test do
  gem "rspec", "2.0.0.beta.19"
  gem "rspec-rails", "2.0.0.beta.19"
end
generate("rspec:install")
