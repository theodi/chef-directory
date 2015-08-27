default['user'] = 'directory'
default['fully_qualified_domain_name'] = 'directory.theodi.org'
default['catch_and_redirect'] = ['members.theodi.org']
default['start_port'] = 8000
default['concurrency'] = 2
default['repo'] = 'theodi/member-directory'

default['deployment']['rack_env'] = 'production'
default['deployment']['revision'] = 'CURRENT'

default['chef_client']['init_style'] = 'none'
default['chef_client']['cron']['use_cron_d'] = true
default['chef_client']['cron']['hour'] = '*'
default['chef_client']['cron']['minute'] = '*/10'
default['chef_client']['cron']['log_file'] = '/var/log/chef/cron.log'

default['ruby-ng']['ruby_version'] = '1.9.3'
default['ruby-ng']['dev_package'] = '1.9.1'

default['envbuilder']['base_dir'] = '/home/directory'
default['envbuilder']['owner'] = 'directory'
default['envbuilder']['group'] = 'directory'
