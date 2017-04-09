
 if node['platform_family'] == 'debian'
     default['apache']['webserver']['package_name']= 'apache2'
 elsif node['platform_family'] == 'rhel'
      default['apache']['webserver']['package_name']= 'httpd'
 end



# default['apache']['webserver']['directory_path']= '/var/www/example.com/public_html'

default["apache"]["sites"]["example.com"] = { "port" => 80, "servername" => "example.com", "serveradmin" => "webmaster@example.com" }
default["apache"]["sites"]["test.com"] = { "port" => 80,  "servername" => "test.com", "serveradmin" => "webmaster@test.com" }
