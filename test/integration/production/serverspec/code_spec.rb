require 'serverspec'
set :backend, :exec

%w{
  build-essential
  libcurl4-openssl-dev
  libmysqlclient-dev
  libxml2-dev
  libxslt1-dev
}.each do |p|
  describe package p do
    it { should be_installed }
  end
end

describe file '/home/directory/directory.theodi.org' do
  it { should be_directory }
  it { should be_owned_by 'directory' }
end

#describe file '/home/directory/.bundle/config' do
#  it { should be_file }
#  it { should be_owned_by 'directory' }
#  its(:content) { should match /BUNDLE_BUILD__NOKOGIRI: --use-system-libraries/ }
#end
#
#describe file '/home/directory/directory.theodi.org/current/vendor/bundle' do
#  it { should be_directory }
#  it { should be_owned_by 'directory' }
#end
#
#describe file '/home/directory/directory.theodi.org/shared/log' do
#  it { should be_directory }
#  it { should be_owned_by 'directory' }
#end
