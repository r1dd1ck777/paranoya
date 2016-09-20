class Emails::ClayTableMailer < ApplicationMailer

  # @param status_check_log StatusCheckLog
  def status_check_fail status_check_log
    status_check = status_check_log.status_check

    mail to: User.pluck(:email),
         subject: "Error on #{status_check.url}",
         body: "#{status_check_log.response}"
  end
end
