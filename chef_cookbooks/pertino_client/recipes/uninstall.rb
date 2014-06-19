#
# Cookbook Name:: pertino_client
# Recipe:: uninstall
#
# Copyright 2014, Pertino
#
# All rights reserved - Do Not Redistribute
#

log "pertino un-installer" do
  message "Removing #{node[:pertino][:version]}"
  level :info
end

service "disable pertino client" do
  service_name "pgateway"
  init_command "/etc/init.d/pgateway"
  pattern "pGateway"
  action [:disable, :stop]
end

package "pertino-client" do
  action :remove
end

case node["platform_family"]
when "debian"
  file "/etc/apt/sources.list.d/pertino.list" do
    action :delete
  end

  execute "remove pertino key" do
    command "apt-key del  #{node[:pertino][:keyid]}"
  end

  execute "apt-get update" do
    action :nothing
  end

when "rhel"
  file "/etc/yum.repos.d/pertino.repo" do
    action :delete
  end
end

