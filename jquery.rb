# This template installs the jquery as prototype replacement
# from Logan Leger, logan@loganleger.com
# http://github.com/lleger/Rails-3-jQuery
# modified by Slava Mikerin

# Deleting old prototype drivers
inside('public/javascripts') do
  run "rm -rf controls.js dragdrop.js effects.js prototype.js rails.js"
end

#download latest jquery 1.4+ 
get "http://ajax.googleapis.com/ajax/libs/jquery/1.4/jquery.min.js", "public/javascripts/jquery.js"
# Downloading latest jQuery drivers
get "http://github.com/rails/jquery-ujs/raw/master/src/rails.js", "public/javascripts/rails.js"

# Overriding default expansion
initializer 'jquery.rb', <<-CODE
# Switch the javascript_include_tag :defaults to
# use jQuery instead of the default prototype helpers.
module ActionView::Helpers::AssetTagHelper
  @@javascript_expansions[:defaults] =%w(
    jquery.js 
    rails.js
  )
end
CODE
