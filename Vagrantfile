# vi: set ft=ruby :

Vagrant::Config.run do |config|
  config.vm.box = "lucid64"
  config.vm.box_url = "http://files.vagrantup.com/lucid64.box"

  config.vm.forward_port 9292, 8080 # guest port 9292 to host 8080

  config.vm.provision :chef_solo do |chef|
  	chef.cookbooks_path =  'cookbooks'

	chef.add_recipe 'rvm::vagrant'
	chef.add_recipe 'rvm::system'

	chef.json = {
		'rvm' => {
			'rubies'       => ['1.9.2'],
			'default_ruby' => '1.9.2',
			'global_gems'  => [
				{'name'    => 'bundler'},
				{'name'    => 'rake', 'version' => '0.9.2'}
			],
			'vagrant' => {
				'system_chef_solo' => '/opt/vagrant_ruby/bin/chef-solo'
			}
		}
	}
  end

  config.vm.provision :shell, :inline => 'cd /vagrant && bundle install'
end
