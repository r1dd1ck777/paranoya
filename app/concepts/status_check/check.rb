class StatusCheck::Check
  class << self

    # @param status_check StatusCheck
    def call status_check
      Rails.logger.info "status_check for #{status_check.to_s}"
      response = response status_check.url
      status_check.status_check_logs.create! response: { headers: response.try(:headers) },
                                             is_fail: response.try(:code) != status_check.status
    end

    protected

    def response url
      RestClient.get(url, headers={})
    rescue SocketError => e
      Rails.logger.debug "#{e.to_s}"
      return nil
    end
  end
end