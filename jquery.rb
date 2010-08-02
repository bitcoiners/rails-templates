# This template installs the new jQuery drivers, removes
# the old prototype drivers, and installs an initializer
# which provides a jquery javscript expansion
# and overrides the :defaults expansion
# Written by: Logan Leger, logan@loganleger.com
# http://github.com/lleger/Rails-3-jQuery

# Deleting old prototype drivers
# Do this first so that you don't delete the new jQuery rails one below
inside('public/javascripts') do
  run "rm -rf controls.js dragdrop.js effects.js prototype.js rails.js"
end

# Downloading latest jQuery drivers
get "http://github.com/rails/jquery-ujs/raw/master/src/rails.js", "public/javascripts/rails.js"

# Overriding default expansion
initializer 'jquery.rb', <<-CODE
# Switch the javascript_include_tag :defaults to
# use jQuery instead of the default prototype helpers.
module ActionView::Helpers::AssetTagHelper
  remove_const :JAVASCRIPT_DEFAULT_SOURCES
  JAVASCRIPT_DEFAULT_SOURCES = %w(
    http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js 
    rails.js
  )
  reset_javascript_include_default
end
CODE
