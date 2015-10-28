default['user'] = 'directory'
default['fully_qualified_domain_name'] = "#{node['user']}.theodi.org"
default['repo'] = "#{node['github_org']}/member-directory"
default['start_port'] = 8000
default['concurrency'] = 2
default['concurrency_string'] = "thin=#{node['concurrency']},worker=1"
default['catch_and_redirect'] = ['members.theodi.org']

default['ruby-ng']['ruby_version'] = '1.9.3'

default['mysql']['database'] = 'member_directory_production'
default['mysql']['username'] = 'member_directory'
default['mysql']['pool'] = 50

default['migrate'] = 'bundle exec rake db:migrate'
default['precompile_assets'] = true
