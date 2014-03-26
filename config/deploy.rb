# config valid only for Capistrano 3.1
lock '3.1.0'

set :application, 'sandbox'
set :repo_url, 'git@github.com:skierkowski/hello.git'
set :deploy_to, '/home/ubuntu/webtest'
set :ssh_options, {:forward_agent=>true}
set :scm, :git
set :format, :pretty
set :log_level, :debug

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:web), in: :sequence, wait: 5 do
      # Your restart mechanism here, for example:
      # execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :publishing, :restart
end
