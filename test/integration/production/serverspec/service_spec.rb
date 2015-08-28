require 'serverspec'
set :backend, :exec

describe service 'directory-thin-2' do
  it { should be_running }
end

describe port(8001) do
  it { should be_listening }
end

describe command 'curl --silent -I http://localhost:8001/members | grep "200 OK"' do
  its(:stdout) { should match /200 OK/ }
end

describe command 'curl --silent -I http://localhost/members | grep "200 OK"' do
  its(:stdout) { should match /200 OK/ }
end

describe command 'wget -qO- http://localhost' do
  its(:stdout) {should match /<title>ODI Member Directory<\/title>/ }
end
