# -*- mode: ruby -*-
# vi: set ft=ruby :
Vagrant.configure("2") do |config|
  config.vm.box = "bento/centos-7.2"
  config.vm.network "forwarded_port", guest: 80, host: 8080
  config.vm.network "private_network", ip: "192.168.33.10"
  # ソースファイルの同期
  config.vm.synced_folder "../vagrant/src", "/home/vagrant/src", :mount_options => ['dmode=777', 'fmode=777']
  # プロビジョン時に使用するファイル群の同期
  config.vm.synced_folder "../vagrant/provision", "/home/vagrant/provision", :mount_options => ['dmode=777', 'fmode=777']
  # nginxの設定ファイル同期
  config.vm.synced_folder "./conf/nginx", "/etc/nginx/conf.d"

  config.vm.provider "virtualbox" do |vb|
    vb.gui = false
    # ボックス名を指定。
    vb.name   = "vagrant-practice"
    # メモリを指定
    vb.memory = "1024"
  end
  # 仮想環境作成時に実行するシェル
  config.vm.provision "shell", :path => "./provision/provision.sh", :privileged => true
  # 起動時に毎回実行するシェル
  config.vm.provision "shell", run: "always", :path => "boot.sh", :privileged => true
end
