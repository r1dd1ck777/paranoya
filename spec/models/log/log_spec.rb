require 'rails_helper'

RSpec.describe Log::Log, type: :model do
  describe "email notifications" do
    it "skips not errors" do
      expect{
        create(:log_log)
      }.not_to change(enqueued_jobs, :size)
    end

    it "sends on errors" do
      expect{
        create(:log_log, level: Log::Log::LEVEL_ERROR)
      }.to change(enqueued_jobs, :size).by(1)
    end
  end
end
