require 'serverspec'
set :backend, :exec

describe file '/home/directory/directory.theodi.org/current/public/assets/application.css' do
  it { should be_file }
end
