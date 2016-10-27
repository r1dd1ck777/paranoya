class UrlTest::Test
  class << self

    # @param url_test UrlTest
    def call url_test
      Rails.logger.info "status_check for #{url_test.to_s}"
      response = response url_test.url
      url_test.url_test_results.create! response_headers: response.try(:headers),
                                        response_code: response.try(:code),
                                        expected_response_code: url_test.expected_response_code,
                                        is_fail: response.try(:code) != url_test.expected_response_code
    end

    protected

    def response url
      RestClient.get(url, headers={})
    rescue SocketError => e
      Rails.logger.debug "#{e.to_s}"
      return nil
    rescue RuntimeError => e
      Rails.logger.debug "#{e.to_s}"
      status = e.to_s.scan(/^([\d]+).*/)[0][0]
      return status
    end
  end
end