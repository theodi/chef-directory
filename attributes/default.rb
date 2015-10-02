default['user'] = 'directory'
default['fully_qualified_domain_name'] = 'directory.theodi.org'
default['catch_and_redirect'] = ['members.theodi.org']
default['start_port'] = 8000
default['concurrency'] = 2
default['concurrency_string'] = "thin=#{node['concurrency']},worker=1"

default['repo'] = 'theodi/member-directory'

default['mysql']['database'] = 'member_directory_production'
default['mysql']['user'] = 'member_directory'
default['mysql']['pool'] = 50

default['migrate'] = 'bundle exec rake db:migrate'

default['ruby-ng']['ruby_version'] = '1.9.3'
default['ruby-ng']['dev_package'] = '1.9.1'
