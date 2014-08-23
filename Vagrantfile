# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.require_version ">= 1.6.0"

WEB_FORWARDED_PORT = ENV['FORWARDED_PORT'] || "8000"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
	config.vm.provider "docker" do |d|
		d.build_dir = "."
		d.volumes = ["/var/www/:/var/www"]
		d.ports = [WEB_FORWARDED_PORT + ":80"]
		d.force_host_vm = true
		d.vagrant_vagrantfile = "./Vagrantfile_dockerhost"
	end
end
