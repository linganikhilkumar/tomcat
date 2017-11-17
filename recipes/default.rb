#
# Cookbook:: tomcat
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.

include_recipe 'java'

execute 'update' do
	command 'sudo apt-get update' 
end
execute 'install-python' do
        command 'sudo apt-get install python2.7'
end
execute 'install-pip' do
        command 'sudo python2.7 get-pip.py'
end
execute 'install-awscli' do
        command 'sudo pip install awscli'
end

package 'tomcat7'

service 'tomcat7' do
        action:start
end


