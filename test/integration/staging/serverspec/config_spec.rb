require 'serverspec'
set :backend, :exec

describe file '/home/directory/directory.theodi.org/shared/config/database.yml' do
  it { should be_file }
  its(:content) { should match /production:/ }
  its(:content) { should match /adapter: mysql2/ }
  its(:content) { should match /pool: 50/ }
  its(:content) { should match /database: member_directory_staging/ }
  its(:content) { should match /username: member_directory/ }
  its(:content) { should match /pool: 50/ }
end
