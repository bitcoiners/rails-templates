#adds active_scaffold plugin and dependents as submodules
plugin 'active_scaffold',   :git => 'git://github.com/vhochstein/active_scaffold.git', :submodule => true
plugin 'verification',      :git => 'git://github.com/rails/verification.git', :submodule => true
#for embedded scaffolds
plugin 'render_component',  :git => 'git://github.com/vhochstein/render_component.git', :submodule => true

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


if yes?("Do you want to generate a foo active_scaffold?")
  generate active_scaffold foo bar:string
  rake "db:migrate"
end