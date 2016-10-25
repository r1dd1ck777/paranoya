threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }.to_i
threads threads_count, threads_count

environment ENV.fetch("RAILS_ENV") { "development" }

# workers ENV.fetch("WEB_CONCURRENCY") { 2 }
# preload_app!
# on_worker_boot do
#   ActiveRecord::Base.establish_connection if defined?(ActiveRecord)
# end

# Allow puma to be restarted by `rails restart` command.
plugin :tmp_restart

puma_config = ENV.fetch("PUMA_STAGE") { "development" }

if puma_config == 'production'
  app_dir = File.expand_path("../..", __FILE__)
  shared_dir = "#{app_dir}/shared"

  daemonize true
  bind "unix://#{shared_dir}/sockets/puma.sock"
  activate_control_app "unix://#{shared_dir}/sockets/puma_ctl.sock"

  # Set master PID and state locations
  pidfile 'tmp/pids/puma.pid'
  state_path 'tmp/pids/puma.state'
  stdout_redirect 'log/puma.log', 'log/puma_err.log'
else
  port        ENV.fetch("PORT") { 3000 }
end
