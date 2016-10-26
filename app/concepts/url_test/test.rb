class UrlTest::Test
  class << self

    # @param url_test UrlTest
    def call url_test
      Rails.logger.info "status_check for #{url_test.to_s}"
      response = response url_test.url
      url_test.url_test_results.create! response_headers: response.try(:headers),
                                        response_code: response.try(:code),
                                        is_fail: response.try(:code) != url_test.status
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