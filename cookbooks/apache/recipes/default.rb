#
# Cookbook:: apache
# Recipe:: default
#
# Copyright:: 2017, The Authors, All Rights Reserved.
bash 'apache' do
  code <<-EOH
    yum update -y
    yum install httpd -y
  EOH
  user 'root'
  action :run
end


