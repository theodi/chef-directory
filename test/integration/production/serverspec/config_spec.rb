require 'serverspec'
set :backend, :exec

describe file '/home/directory/directory.theodi.org/shared/config/database.yml' do
  it { should be_file }
  its(:content) { should match /production:/ }
  its(:content) { should match /adapter: mysql2/ }
  its(:content) { should match /pool: 50/ }
  its(:md5sum) { should eq '2c9f9861feb79aed351514e9bf241537' }
end
