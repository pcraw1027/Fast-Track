# config valid for current version and patch releases of Capistrano
lock "~> 3.19.2"

server "13.53.135.242", user: "deploy", roles: %w{app db web}, primary: true

set :application, "fast_track"
set :repo_url, "git@github.com:pcraw1027/Fast-Track.git"

set :ruby, '3.2.3'
set :passenger_restart_with_touch, true
set :branch, 'main'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/var/www/fast_track"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
append :linked_files, "config/credentials/production.key", "config/secrets.yml"

# Default value for linked_dirs is []
append :linked_dirs, "log", "tmp/pids", "tmp/cache", "tmp/sockets", "public/system", "vendor", "storage"

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
set :keep_releases, 5
set :default_env, {  }

set :default_env, {
  'NODE_OPTIONS' => '--openssl-legacy-provider',
  'FAST_TRACK_DB' => ENV['FAST_TRACK_DB'],
  'FAST_TRACK_DB_USER' => ENV['FAST_TRACK_DB_USER'],
  'FAST_TRACK_DB_HOST' => 'localhost',
  'FAST_TRACK_DB_PORT' => '5432',
  'FAST_TRACK_DB_PASSWORD' => ENV['FAST_TRACK_DB_PASSWORD']
}

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure


namespace :deploy do
  desc "Run seed"
  task :seed do
    on roles(:all) do
      within current_path do
        execute :bundle, :exec, 'rails', 'db:seed', 'RAILS_ENV=production'
      end
    end
  end
 
  after :migrating, :seed

  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end


end