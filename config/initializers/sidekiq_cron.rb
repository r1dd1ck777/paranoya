[
    StatusCheck::Worker
].each do |worker|
  job = Sidekiq::Cron::Job.new(name: worker.to_s, cron: '* * * * *', class: worker)
  job.valid? ? job.save : puts(job.errors)
end

