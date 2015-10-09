desc 'Create database'
task :crebas do
  print 'Creating database... '
  sh 'cat test/sql/crebas.sql | mysql -u root'
end

desc 'Start local MySQL server'
task :start_mysql do
  print 'Starting MySQL... '
  sh 'mysql.server start' do |ok, res|
    if ! ok
      puts '********************************************************'
      puts 'FAIL!'
      puts 'Are you sure MySQL is installed?'
      puts 'Make sure `mysql.server start` works before trying again'
      puts '********************************************************'
    end
  end
end

desc 'Prepare MySQL for an attack run'
task prepare_database: [:start_mysql, :crebas]

desc 'Destroy test instance'
task :destroy do
  sh 'bundle exec kitchen destroy'
end

desc 'Converge test instance'
task :converge do
  sh 'bundle exec kitchen converge'
end

desc 'Verify test instance'
task :verify do
  sh 'bundle exec kitchen verify'
end

desc 'Run tests from scratch'
task scratch: [
  :destroy,
  :verify
]

desc 'Do everything from a cold start'
task test: [
  :prepare_database,
  :scratch
]

task default: :test
