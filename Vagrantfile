# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|
  
  config.ssh.username = "root"
  config.ssh.password = "vagrant"

  config.vm.box = "bigtrouble"
  config.vm.box_url = "bigtrouble.box"

  config.vm.network "private_network", ip: "192.168.56.10"
  config.vm.hostname = "trouble"

  config.vm.network :forwarded_port, guest: 80, host: 8080, auto_correct: true
  config.vm.network :forwarded_port, guest: 8080, host: 8090, auto_correct: true

  config.vm.provider "virtualbox" do |vb|
    vb.memory = "1024"
    vb.name = "trouble"
  end

  config.vm.post_up_message = "VM is looking forward to being fixed!
  Use `vagrant ssh` to connect to the host in terminal
  Browse Site: 
    - Web frontend:   http://localhost:8080/
    - Tomcat backend: http://localhost:8090/
  "

  config.vm.provision "shell", inline: <<-SHELL
    echo "let's get the ball rolling!"
  SHELL

  config.vm.provision "shell", path: "install.sh"

  config.vm.provision "file", source: "httpd.conf", destination: "/etc/httpd/conf/httpd.conf"
  config.vm.provision "file", source: "hosts", destination: "/etc/hosts"
  config.vm.provision "file", source: "environment", destination: "/etc/environment"
  config.vm.provision "file", source: "setenv.sh", destination: "/opt/apache/tomcat/current/bin/setenv.sh"
  config.vm.provision "file", source: ".bashrc", destination: "/home/tomcat/.bashrc"
  config.vm.provision "file", source: "workers.properties", destination: "/etc/httpd/conf.d/workers.properties"
  config.vm.provision "file", source: "iptables", destination: "/etc/sysconfig/iptables"
  config.vm.provision "file", source: "tomcat-native-1.2.14-src", destination: "/opt/tomcat-native-1.2.14-src"

  config.vm.provision "shell", path: "tomcat.sh"

end
