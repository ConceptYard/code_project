set :application, 'code-project'
set :repo_url, 'ssh://git@github.com/ConceptYard/code-project.git'

set :deploy_via, :remote_cache
set :use_sudo, false

set :format, :pretty
set :pty, false

set :rvm_type, :user
set :rvm_ruby_version, 'ruby-2.4.1@code-project'
set :rvm_ruby_string, 'ruby-2.4.1@code-project'
set :rvm_bin_path, '/home/deployer/.rvm/bin'

set :linked_files, %w{config/database.yml config/application.yml .ruby-version .ruby-gemset}
set :linked_dirs, %w{bin log tmp/sessions tmp/pids tmp/cache tmp/sockets tmp/files vendor/bundle public/system public/sitemaps bundle public/uploads public/assets}

set :keep_releases, 5

set :unicorn_env, :rails_env

namespace :unicorn do

  %w[start stop reload restart].each do |command|
    desc "#{command} unicorn server"
    task command do
      on roles(:app) do
        within release_path do
          env = fetch(:default_environment).map{|k,v| "#{k}=#{v}"}.join(' ')
          execute "#{env} #{fetch(:start_stop_script)} #{command}"
        end
      end
    end
  end

end

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      within release_path do
        with rails_env: fetch(:rails_env) do
          execute :rake, "unicorn:stop"
          execute :rake, "unicorn:start"
        end
      end
    end
  end

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

  after :finishing, 'deploy:cleanup'
  after :finishing, 'deploy:restart'

end
