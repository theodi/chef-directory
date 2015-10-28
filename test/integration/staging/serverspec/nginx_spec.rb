require 'serverspec'
set :backend, :exec

describe package 'nginx' do
  it { should be_installed }
end

describe service 'nginx' do
  it { should be_running }
end

describe file '/etc/nginx/sites-enabled/directory.theodi.org' do
  it { should be_symlink }
  its(:content) { should match /server 127.0.0.1:8001;/ }
  its(:content) { should match /listen 80 default;/ }
  its(:content) { should match /server_name staging.directory.theodi.org;/ }
  its(:content) { should match /root \/home\/directory\/directory.theodi.org\/current\/public\/;/ }
  its(:content) { should match /proxy_pass http:\/\/directory;/ }
  its(:content) { should match /server_name members.theodi.org;/ }
end
