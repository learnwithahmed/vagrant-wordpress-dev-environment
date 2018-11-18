# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
    config.vm.box      = "ubuntu/trusty64"
    config.vm.box_url  = "https://vagrantcloud.com/ubuntu/trusty64"
    config.vm.hostname = "app"

    # Machine name in vagrant status
    config.vm.define "app" do |app|
    end
    config.vm.provider :virtualbox do |vb|
	vb.name = "app"
    end

    # Required for NFS to work, pick any local IP
    config.vm.network :private_network, ip: '192.168.221.19'
    # Use NFS for shared folders for better performance
    config.vm.synced_folder "./", "/var/www", :nfs => true

    config.vm.provider :virtualbox do |v|
	v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
	v.customize ["modifyvm", :id, "--memory", 512]
    end

    config.hostmanager.aliases = %w(app.local)

    config.hostmanager.enabled = true
    config.hostmanager.manage_host = true
    config.hostmanager.ignore_private_ip = false
    config.hostmanager.include_offline = true
    config.hostmanager.ip_resolver = proc do |vm, resolving_vm|
	if hostname = (vm.ssh_info && vm.ssh_info[:host])
	    `vagrant ssh -c "hostname -I"`.split()[1]
	end
    end

    config.vm.provision :shell do |s|
	s.path = "provision/server/install.sh"
    end

    config.vm.provision :shell do |s|
	s.path = "provision/php/install.sh"
	s.args = "/var/www app.local "
    end

    config.vm.provision :shell do |s|
	s.path = "provision/git/install.sh"
    end

    config.vm.provision :shell do |s|
	s.path = "provision/composer/install.sh"
	s.args = "app /var/www "
    end

    config.vm.provision :shell do |s|
	s.path = "provision/mysql/install.sh"
	s.args = "db root /var/www "
    end

    config.vm.provision :shell do |s|
	s.path = "provision/server/boot.sh"
	s.args = "/var/www"
    end
end
