class UrlTestResult::SendNotification
  class << self

    # @param url_test_result UrlTestResult
    def call url_test_result
      return nil unless url_test_result.is_fail
      return nil if send_too_often? url_test_result

      url_test_result.users.each do |user|
        Emails::ClayTableMailer.status_check_fail(user, url_test_result).deliver_now
        Smsfly.send_sms("Error on #{url_test_result.url_test.url} (code #{url_test_result.response_code})", user.phone) if user.phone.present?
      end
    end

    protected

    def send_too_often? url_test_result
      UrlTestResult.where('created_at > ?', send_interval.ago)
          .where(url_test: url_test_result.url_test)
          .where(is_fail: true)
          .where.not(id: url_test_result.id)
          .any?
    end

    def send_interval
      30.minutes
    end
  end
end