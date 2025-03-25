# config valid for current version and patch releases of Capistrano
lock "~> 3.19.2"

server "13.53.135.242", user: "deploy", roles: %w{app db web}, primary: true

set :application, "fast_track"
set :repo_url, "git@github.com:pcraw1027/Fast-Track.git"

set :ruby, '3.2.3'

set :branch, 'main'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Ensure correct Puma settings
set :puma_threads, [4, 16]
set :puma_workers, 2

set :puma_bind, "unix:///var/www/fast_track/shared/sockets/puma.sock"
set :puma_state, "/var/www/fast_track/shared/pids/puma.state"
set :puma_pid, "/var/www/fast_track/shared/pids/puma.pid"
set :puma_access_log, "/var/www/fast_track/shared/log/puma.access.log"
set :puma_error_log, "/var/www/fast_track/shared/log/puma.error.log"

set :puma_preload_app, true
# set :puma_prune_bundler, true

set :puma_service_unit_name, "puma_#{fetch(:application)}"
set :puma_systemctl_user, :system
set :puma_restart_command, 'bundle exec puma -C config/puma.rb'
#set :puma_restart_command, '/usr/local/bin/bundle exec /var/www/fast_track/shared/bundle/ruby/3.2.0/bin/puma -C config/puma.rb'


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
set :keep_releases, 3

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
  # desc "Run seed"
  # task :seed do
  #   on roles(:all) do
  #     within current_path do
  #       execute :bundle, :exec, 'rails', 'db:seed', 'RAILS_ENV=production'
  #     end
  #   end
  # end
 
  # after :migrating, :seed
  
  after :restart, :clear_cache do
    on roles(:web), in: :groups, limit: 3, wait: 10 do
      # Here we can do anything such as:
      # within release_path do
      #   execute :rake, 'cache:clear'
      # end
    end
  end

  # Ensure puma starts on deploy
  after :publishing, 'puma:restart'

end