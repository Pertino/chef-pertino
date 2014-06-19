#
# Cookbook Name:: pertino_client
# Recipe:: default
#
# Copyright 2014, Pertino
#
# All rights reserved - Do Not Redistribute
#

log "pertino installer" do
  message "Installing Pertino client"
  level :info
end

case node["platform_family"]
when "debian"
  package "wget" do
    action :install
  end

  package "resolvconf" do
    action :install
  end

  cookbook_file "pertino.sources" do
    path "/etc/apt/sources.list.d/pertino.list"
    notifies :run, "execute[add repo key]", :immediately
    notifies :run, "execute[apt-get update]", :immediately
  end

  execute "add repo key" do
    command "wget -O - http://reposerver.pertino.com/Pertino-GPG-Key.pub | apt-key add -"
    action :nothing
  end

  execute "apt-get update" do
    action :nothing
  end

when "rhel"
  cookbook_file "pertino.repo" do
    path "/etc/yum.repos.d/pertino.repo"
  end
end

credentials = data_bag_item('credentials', 'pertino')

package "pertino-client" do
  action :install
  notifies :run, "execute[configure pertino client]", :immediately
end

execute "configure pertino client" do
  command "/opt/pertino/pgateway/.pauth -u '#{credentials['username']}' -p '#{credentials['password']}'"
  cwd "/opt/pertino/pgateway"
  action :nothing
  notifies :start, "service[enable pertino client]", :delayed
end

service "enable pertino client" do
  service_name "pgateway"
  init_command "/etc/init.d/pgateway"
  pattern "pGateway"
  action :enable
end
