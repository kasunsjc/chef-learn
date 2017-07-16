#
# Cookbook Name:: learn_chef_httpd
# Recipe:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.
package 'httpd'

service 'httpd' do
  action [:enable, :start]
end

group 'web_admin'

user 'web_admin' do
  shell '/bin/bash'
  group 'web_admin'
  system true
  action :create
end

template '/var/www/html/index.html' do
  source 'index.html.erb'
  mode '0644'
  owner 'web_admin'
  group 'web_admin'
end
