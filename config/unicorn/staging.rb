# Set your full path to application.
app_path = "/var/www/sites/southcoastdeli/current"

# Set unicorn options
wp = if ENV['SH_UNICORN_WORKERS'].to_i > 0
       ENV['SH_UNICORN_WORKERS'].to_i
     elsif ENV['RAILS_ENV'] == 'staging'
       4
     else
       2
     end

worker_processes (wp)

preload_app true
timeout 40

# Spawn unicorn master worker for user apps (group: apps)
user 'deployer', 'deployer'

# Fill path to your app
working_directory app_path

# Set master PID location
pid "#{app_path}/tmp/pids/unicorn.pid"
listen "#{app_path}/tmp/sockets/unicorn.sock", :backlog => 1024
stderr_path "#{app_path}/log/unicorn.stderr.log"
stdout_path "#{app_path}/log/unicorn.stdout.log"

# http://www.rubyenterpriseedition.com/faq.html#adapt_apps_for_cow
if GC.respond_to?(:copy_on_write_friendly=)
  GC.copy_on_write_friendly = true
end

before_fork do |server, worker|
  old_pid = "#{server.config[:pid]}.oldbin"
  if File.exists?(old_pid) && server.pid != old_pid
    begin
      Process.kill("QUIT", File.read(old_pid).to_i)
    rescue Errno::ENOENT, Errno::ESRCH
      # someone else did our job for us
    end
  end

  defined?(ActiveRecord::Base) and
      ActiveRecord::Base.connection.disconnect!
end

after_fork do |server, worker|
  ActiveRecord::Base.establish_connection

  # Create worker pids too
  child_pid = server.config[:pid].sub(/pid$/, "worker.#{worker.nr}.pid")
  system("echo #{Process.pid} > #{child_pid}")

end
