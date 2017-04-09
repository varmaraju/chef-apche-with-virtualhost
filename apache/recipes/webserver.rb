package_name = node['apache']['webserver']['package_name']
  package package_name do 
   action :install
end

service package_name do
 action [:start, :enable]
end


node["apache"]["sites"].each do |sitename, data|


 document_root = "/var/www/#{sitename}/public_html"
  directory document_root do
   mode "0755"
   recursive true
  end


template "/etc/apache2/sites-available/#{sitename}.conf" do 
   source "virtualhosts.erb"
   mode "0644"
  variables(
      :document_root => document_root,
      :port => data["port"],
      :serveradmin => data["serveradmin"],
      :servername  => data["servername"]
    )
 end

file "/var/www/#{sitename}/public_html/index.html" do
  content " HI this is #{sitename}"
end
end


















