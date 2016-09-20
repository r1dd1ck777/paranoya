class StatusCheckLog::SendNotification
  class << self

    # @param status_check_log StatusCheckLog
    def call status_check_log
      return nil unless status_check_log.is_fail
      return nil if send_too_often? status_check_log

      Emails::ClayTableMailer.status_check_fail(status_check_log).deliver_now
    end

    protected

    def send_too_often? status_check_log
      StatusCheckLog.where('created_at > ?', send_interval.ago)
          .where(status_check: status_check_log.status_check)
          .where(is_fail: true)
          .where.not(id: status_check_log.id)
          .any?
    end

    def send_interval
      30.minutes
    end
  end
end