#
# Cookbook:: tomcat
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

include_recipe 'java'

execute 'update' do
	command 'apt-get update' 
end
execute 'install-python' do
        command 'apt-get install python2.7'
end
execute 'install-pip' do
        command 'python2.7 get-pip.py'
end
execute 'install-awscli' do
        command 'pip install awscli'
end
package 'tomcat7'

service 'tomcat7' do
        action:start
end

template "/tmp/aws.sh" do 
  source "copy.erb" 
  owner "root" 
  group "root" 
  mode "0644" 
end

execute 'sh /tmp/aws.sh' do
 command 'sh /tmp/aws.sh'
end
service 'tomcat7' do
        action:restart
end


