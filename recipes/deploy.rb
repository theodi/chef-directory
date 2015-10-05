deploy_revision "/home/#{node['user']}/#{node['fully_qualified_domain_name']}" do
  repo "git://github.com/#{node['repo']}"
  user node['user']
  group node['user']
  revision node['deployment']['revision']
  migrate node.has_key? :migrate
  migration_command node['migrate']
  action :deploy
  environment(
    'RACK_ENV' => node['deployment']['rack_env']
  )

  before_migrate do
    current_release_directory = release_path

    pre_bundle node['user'] do
      release_path current_release_directory
      fully_qualified_domain_name node['fully_qualified_domain_name']
    end

    database_yml node['user'] do
      fully_qualified_domain_name node['fully_qualified_domain_name']
    end

    bundlify node['user'] do
      cwd current_release_directory
    end
  end

  before_restart do
    current_release_directory = release_path

    precompile_assets do
      cwd current_release_directory
      user node['user']
    end

    foremanise node['user'] do
      cwd current_release_directory
      port node['start_port']
      concurrency_string node['concurrency_string']
    end

    make_vhosts do
      cwd current_release_directory
      user node['user']
      fqdn node['fully_qualified_domain_name']
    end
  end

  restart_command "sudo service #{node['user']} restart"
  notifies :restart, "service[nginx]"
end
