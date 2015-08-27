require 'serverspec'
set :backend, :exec

describe file '/home/directory/env' do
  it { should be_file }
  its(:content) { should match /SESSION_SECRET_DIRECTORY: 8184842351530937c9c8c2e723fd03f4/ }
end

#describe file '/home/directory/directory.theodi.org/current/.env' do
#  it { should be_symlink }
#  its(:content) { should match /SESSION_SECRET_DIRECTORY: 8184842351530937c9c8c2e723fd03f4/ }
#end
