#adds active_scaffold plugin and dependents as submodules
plugin 'active_scaffold',   :git => 'git://github.com/vhochstein/active_scaffold.git', :submodule => true
plugin 'verification',      :git => 'git://github.com/rails/verification.git', :submodule => true
#for embedded scaffolds
plugin 'render_component',  :git => 'git://github.com/vhochstein/render_component.git', :submodule => true


gsub_file 'vendor/plugins/active_scaffold/environment.rb', 
  /#ActiveScaffold.js_framework = :jquery/,
   'ActiveScaffold.js_framework = :jquery'

inject_into_file "app/views/layouts/application.html.erb", 
                  "<%= active_scaffold_includes %>", 
                  :after => "<%= javascript_include_tag :defaults %>"

inject_into_file "app/views/layouts/application.html.erb", 
                  :after => "<%= javascript_include_tag :defaults %>" do
    gems = ask "Which gems would you like to add?"
    gems.split(" ").map{ |gem| "  config.gem :#{gem}" }.join("\n")
end


=begin
inside('vendor/plugins/active_scaffold') { 
#ActiveScaffold.js_framework = :jquery
  gsub_file 'environment.rb', /#ActiveScaffold.js_framework = :jquery/ do |match|
    match << "ActiveScaffold.js_framework = :jquery"
  end 
}



if yes?("Do you want to generate a foo active_scaffold?")
  #generate("active_scaffold", "foo bar:string")
  #rake("db:migrate")
end


file 'app/views/layouts/application.html.erb', 
%q{<!DOCTYPE html>
<html>
<head>
  <title>FIXME</title>
  <%= stylesheet_link_tag :all %>
  <%= javascript_include_tag :defaults %>
  <%= active_scaffold_includes %>
  <%= csrf_meta_tag %>
</head>
<body>

<%= yield %>

</body>
</html>
}

=end



