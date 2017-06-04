# == Schema Information
#
# Table name: log_logs
#
#  id         :integer          not null, primary key
#  project_id :integer
#  message    :string
#  data       :json
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  level      :integer          default(0)
#

class Log::Log < ApplicationRecord
  LEVEL_DEBUG = 0
  LEVEL_INFO = 1
  LEVEL_WARN = 2
  LEVEL_ERROR = 3
  LEVEL_FATAL = 4
  LEVEL_UNKNOWN = 5

  belongs_to :project

  after_initialize :setup_defaults
  after_create_commit :try_send_notifications

  protected

  def setup_defaults
    self.level ||= 0
  end

  def try_send_notifications
    return unless level >= LEVEL_ERROR
    p 'try_send_notifications'
    Log::Log::Mailer.notification(
      to: project.user_emails_to_notify,
      project_name: project.name,
      message: message,
      data: data,
      level: level
    ).deliver_later
  end

  class Mailer < ApplicationMailer
    def notification(to:, project_name:, message:, data:, level:, **options)
      data ||= {}

      mail(
        to: to,
        subject: "Log, project: #{project_name}, level: #{level}, message: #{message}",
        body: "Message: #{message}. Data: #{data.to_json}"
      )
    end
  end
end
