require 'rails_helper'

RSpec.describe UrlTest::Test, type: :model do
  describe "testing url_test_result" do
    it "wit valid url" do
      url_test = create(:url_test)
      url_test_result = subject.(url_test)
      expect(url_test_result.is_fail).to eq false
    end

    it "wit valid url" do
      url_test = create(:url_test, :with_invalid_url)
      url_test_result = subject.(url_test)
      expect(url_test_result.is_fail).to eq true
    end
  end

  describe "sending motifications" do
    let!(:url_test) do
      create(:url_test, :with_invalid_url)
    end

    it "for the first time" do
      expect{
        subject.(url_test)
      }.to change(enqueued_jobs, :size).by(1)
    end
  end
end
