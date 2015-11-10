# -*- mode: ruby -*-
# # vi: set ft=ruby :

Vagrant.require_version ">= 1.6.0"

$num_instances = 3
$instance_name_prefix = "ddd"
$vm_gui = false
$vm_memory = 1024
$vm_cpus = 1

Vagrant.configure("2") do |config|
  (1..$num_instances).each do |i|
    config.vm.box = "cargonauts/ddd"
    config.vm.define vm_name = "%s-%02d" % [$instance_name_prefix, i] do |config|
      # Set up hostname.
      config.vm.hostname = vm_name

      # Set up VM.
      config.vm.provider :virtualbox do |vb|
        vb.gui = $vm_gui
        vb.memory = $vm_memory
        vb.cpus = $vm_cpus
      end

      # Set up networking.
      ip = "172.17.8.#{i+100}"
      config.vm.network :private_network, ip: ip

      # Provision machine.
      config.vm.provision "shell", path: "scripts/provision.sh", :args => "%s %d %d" % [$instance_name_prefix, i, $num_instances]
    end
  end
end
