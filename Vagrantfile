# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "debian/jessie64"
  config.vm.provision :shell, path: "bootstrap.sh"

  # Disable automatic box update checking.
  config.vm.box_check_update = false

  # Create a forwarded port mapping
  #config.vm.network "forwarded_port", guest: 999, host: 9999

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network "private_network", ip: "10.0.0.2"

  # If true, then any SSH connections made will enable agent forwarding.
  config.ssh.forward_agent = true
  
  # X11 forwarding needed for some R packages
  config.ssh.forward_x11 = true

  # Share an additional folder to the guest VM.
  #config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration
  config.vm.provider "virtualbox" do |vb|
    # Don't boot with headless mode
    vb.gui = true

    # Use VBoxManage to customize the VM. For example to change memory:
    vb.customize ["modifyvm", :id, "--memory", "4096"]
  end

  config.vm.provider "virtualbox" do |v|
    v.memory = 4096
    v.cpus = 2
  end
end


