#
# Cookbook Name:: learn_chef_iis
# Recipe:: default
#
# Copyright (c) 2017 The Authors, All Rights Reserved.
powershell_script 'Install IIS' do
  code 'Add-WindowsFeature Web-Server'
  guard_interpreter :powershell_script
  not_if '(Get-WindowsFeature -Name Web-Server).Installed'
end

service 'W3SVC' do
  action [:enable, :start]
end

directory 'c:\inetpub\wwwroot' do
  owner 'IIS_IUSRS'
  recursive true
  action :create
end

template 'c:\inetpub\wwwroot\Default.htm' do
  source 'Default.htm.erb'
end
