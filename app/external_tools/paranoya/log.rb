# frozen_string_literal: true

module Paranoya
  module Log
    PATH = "/api/v1/log/logs"
    TEST_PROJECT_ID = 7

    class << self
      def call(message, data = {})
        send_message(message, data)
      end

      # Paranoya::Log.track("foo", {env: 'production'}) { raise "bar" }
      def track message, data = {}, &block
        data.clone
        send_message(message + " (start)", data)
        result = yield
        send_message(message + " (end)", data)
        result
      rescue => e
        message = "#{message} (rescue). #{e.to_s}"
        data[:backtrace] = e.backtrace
        send_message(message, data)
        raise e
      end

      protected

      def send_message(message, data = {})
        Paranoya::Http.post(PATH, payload: {
            attributes: {
                project_id: TEST_PROJECT_ID,
                data: {
                    env: Rails.env.to_s,
                    data: data
                },
                message: message
            }
        })
      end
    end
  end
end
