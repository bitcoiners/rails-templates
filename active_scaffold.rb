# active_scaffold.rb for rails 3
# from Slava Mikerin

#adds active_scaffold plugin and dependents as submodules
plugin 'active_scaffold',   :git => 'git://github.com/vhochstein/active_scaffold.git', :submodule => true
plugin 'verification',      :git => 'git://github.com/rails/verification.git', :submodule => true
#for embedded scaffolds
plugin 'render_component',  :git => 'git://github.com/vhochstein/render_component.git', :submodule => true


#sets active_scaffold to use jquery
gsub_file 'vendor/plugins/active_scaffold/environment.rb', 
  /#ActiveScaffold.js_framework = :jquery/,
   'ActiveScaffold.js_framework = :jquery'

#adds active_scaffold includes
inject_into_file "app/views/layouts/application.html.erb", 
                  "\n<%= active_scaffold_includes %>\n", 
                  :after => "<%= javascript_include_tag :defaults %>"


