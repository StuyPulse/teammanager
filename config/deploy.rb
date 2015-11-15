# config valid only for current version of Capistrano
lock '3.4.0'

server 'manage.stuypulse.com', port: 22, roles: [:web, :app, :db], primary: true

set :application, 'teammanager'
set :repo_url, 'git@github.com:Team694/teammanager.git'
set :user, 'deploy'
set :branch, 'master'

set :deploy_to, "/home/#{fetch(:user)}/apps/#{fetch(:application)}"

# Ensure the sqlite3 db goes to a shared directory
set :linked_files, %w(db/production.sqlite3)

set :pty,             true
set :use_sudo,        false
set :stage,           :production
set :deploy_via,      :remote_cache
set :ssh_options,     { forward_agent: true, user: fetch(:user), keys: %w(~/.ssh/id_rsa.pub) }

# capistrano3-puma
set :puma_threads, [4, 16]
set :puma_access_log, "#{release_path}/log/puma.error.log"
set :puma_error_log,  "#{release_path}/log/puma.access.log"
set :puma_init_active_record, true

namespace :puma do
  desc 'Create directories for Puma pids and socket'
  task :make_dirs do
    on roles(:app) do
      execute "mkdir #{shared_path}/tmp/sockets -p"
      execute "mkdir #{shared_path}/tmp/pids -p"
    end
  end

  before :start, :make_dirs
end

namespace :deploy do
  desc "Make sure local repository is in sync with remote"
  task :check_revision do
    on roles(:app) do
      unless `git rev-parse HEAD` == `git rev-parse origin/#{fetch(:branch)}`
        puts "WARNING: HEAD is not the same as origin/#{fetch(:branch)}"
        puts "Run `git push` to sync changes."
        exit
      end
    end
  end

  desc 'Initial deploy'
  task :initial do
    on roles(:app) do
      before 'deploy:restart', 'puma:start'
      invoke 'deploy'
    end
  end

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      invoke 'puma:restart'
    end
  end

  before :starting,     :check_revision
  after  :finishing,    :compile_assets
  after  :finishing,    :cleanup
  after  :finishing,    :restart
end
