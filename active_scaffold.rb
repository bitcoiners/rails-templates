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
                  "<%= active_scaffold_includes %>", 
                  :after => "<%= javascript_include_tag :defaults %>"



=begin
if yes?("Do you want to generate a foo active_scaffold?")
  #generate("active_scaffold", "foo bar:string")
  #rake("db:migrate")
end

=end



