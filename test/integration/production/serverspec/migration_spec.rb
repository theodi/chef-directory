require 'serverspec'
set :backend, :exec

describe command "cd /home/directory/directory.theodi.org/current && RAILS_ENV=production bundle exec rails runner 'Member.first'" do
  its(:exit_status) { should eq 0 }
end
