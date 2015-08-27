default['chef_client']['init_style'] = 'none'
default['chef_client']['cron']['use_cron_d'] = true
default['chef_client']['cron']['hour'] = '*'
default['chef_client']['cron']['minute'] = '*/10'
default['chef_client']['cron']['log_file'] = '/var/log/chef/cron.log'

default['ruby-ng']['ruby_version'] = '1.9.3'
default['ruby-ng']['dev_package'] = '1.9.1'
