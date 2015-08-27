user = node['user']
group = node['user']
fqdn = node['fully_qualified_domain_name']

include_recipe 'git'
include_recipe 'chef-client::config'
include_recipe 'chef-client::cron'
include_recipe 'odi-pk'
include_recipe 'odi-users'
include_recipe 'envbuilder'

include_recipe 'ruby-ng'
include_recipe 'ruby-ng::dev' unless node['ruby-ng']['dev_package']

include_recipe 'chef_directory::dependencies'

include_recipe 'odi-monitoring'

deploy_revision "/home/#{user}/#{fqdn}" do
  repo "git://github.com/#{node['repo']}"
  user user
  group group
  revision node['deployment']['revision']
  migrate node.has_key? :migrate
  migration_command node['migrate']
#  BORK
#    * ONLY A SINGLE NODE SHOULD DO DEPLOY TASKS - SOMETHING REDIS QUEUE
  action :deploy
  environment(
    'RACK_ENV' => node['deployment']['rack_env']
  )
end
