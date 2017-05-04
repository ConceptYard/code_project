set :stage, :production

server '159.203.252.235', user: 'deployer', roles: %w{web app db}, primary: true

set :deploy_to, "/var/www/sites/code_project"
set :rails_env, "production"
set :start_stop_script, "/etc/init.d/code_project"
set :branch, "master"

fetch(:default_env).merge!(rails_env: :production)
