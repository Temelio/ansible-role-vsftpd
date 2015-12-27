# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "ubuntu/trusty64"

  # Update system and install requirements
  config.vm.provision "shell" do |sh|
    sh.inline = "sudo apt-get update \
                  && sudo apt-get install python-pip curl -y \
                  && sudo pip install ansible pytest"
  end

  # Run pytest tests for filter plugins
  config.vm.provision "shell" do |sh|
    sh.inline = "cd /vagrant && rm tests/__pycache__/*.pyc && py.test -v"
    sh.privileged = false
  end

  # Run Ansible provisioning
  config.vm.provision "ansible" do |ansible|

    # Playbook used to test role
    ansible.playbook  = "tests/test_vagrant.yml"
  end

  # Run Serverspec tests
  config.vm.provision "serverspec" do |serverspec|

    # Define spec files pattern
    serverspec.pattern = 'spec/*_spec.rb'
  end

end

