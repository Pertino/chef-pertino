# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  config.vm.define "chefsolo_deb" do |cs|
    cs.vm.box = "vbox_precise"
    cs.vm.box_url = "http://files.vagrantup.com/precise64.box"
    cs.vm.network :public_network
    cs.vm.provision "shell", id: "shell_setup", inline: "apt-get -y update & apt-get install -y wget && wget -L https://www.opscode.com/chef/install.sh | sudo sh"
    cs.vm.provision "chef_solo" do |csolo|
      csolo.cookbooks_path = "./chef_cookbooks"
      csolo.data_bags_path = "./chef_data_bags"
      csolo.add_recipe "pertino_client"
    end
  end

  config.vm.define "chefsolo_rpm" do |cs|
    cs.vm.box = "centos_6_5"
    cs.vm.box_url = "https://vagrantcloud.com/nrel/CentOS-6.5-x86_64/version/4/provider/virtualbox.box"
    cs.vm.network :public_network
    cs.vm.provision "shell", id: "shell_setup", inline: "yum install -y wget && wget -L https://www.opscode.com/chef/install.sh | sudo sh"
    cs.vm.provision "chef_solo" do |csolo|
      csolo.cookbooks_path = "./chef_cookbooks"
      csolo.data_bags_path = "./chef_data_bags"
      csolo.add_recipe "pertino_client"
    end
  end

end
