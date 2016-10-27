task :rake, [] => 'deploy:set_rails_env' do |t, args|
  on roles(:app), in: :sequence, wait: 5 do
    with rails_env: fetch(:rails_env) do
      within current_path do
        execute :rake, ENV['TASK']
      end
    end
  end
end