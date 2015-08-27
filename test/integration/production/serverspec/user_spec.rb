require 'serverspec'
set :backend, :exec

describe user 'directory' do
  it { should exist }
end
