require 'serverspec'
set :backend, :exec

describe file '/var/log/directory' do
  it { should be_directory }
end

describe file '/var/run/directory' do
  it { should be_directory }
end

describe file '/etc/init/directory.conf' do
  it { should be_file }
  its(:content) { should match /start on runlevel \[2345\]/ }
end

describe file '/etc/init/directory-thin.conf' do
  it { should be_file }
  its(:content) { should match /start on starting directory/ }
  its(:md5sum) { should eq 'adc11ed425119ec2fe5e6047af109e91' }
end

describe file '/etc/init/directory-thin-2.conf' do
  it { should be_file }
  its(:content) { should match /start on starting directory-thin/ }
  its(:content) { should match /exec su - directory -c/ }
  its(:content) { should match /PORT=8001/ }
  its(:content) { should match /RACK_ENV=production/ }
  its(:content) { should match /RAILS_ENV=production/ }
  its(:content) { should match /bundle exec thin start -p \$PORT >> \/var\/log\/directory\/thin-2.log 2>&1/ }
end

describe file '/etc/init/directory-worker-1.conf' do
  it { should be_file }
  its(:content) { should match /bundle exec rake resque:work TERM_CHILD=1 QUEUE=directory/ }
end
