user = node['user']
group = node['user']
fqdn = node['fully_qualified_domain_name']

include_recipe 'git'
include_recipe 'chef-client::config'
include_recipe 'chef-client::cron'
include_recipe 'odi-pk'
include_recipe 'odi-users'

include_recipe 'ruby-ng'
include_recipe 'ruby-ng::dev' unless node['ruby-ng']['dev_package']

include_recipe 'chef_directory::dependencies'

include_recipe 'odi-monitoring'
