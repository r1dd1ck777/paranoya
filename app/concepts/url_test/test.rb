module UrlTest::Test
  class << self

    # @param url_test UrlTest
    # Example:
    #  UrlTest::Test.(url_test)
    def call(url_test)
      Rails.logger.debug "status_check for #{url_test.to_s}"
      response = retrieve_response(url_test.url)
      url_test.url_test_results.create! response_headers: response[:headers],
                                        response_code: response[:code],
                                        expected_response_code: url_test.expected_response_code,
                                        url: url_test.url,
                                        is_fail: response[:code] != url_test.expected_response_code
    end

    protected

    # get response data
    # will try one more time if code == ''
    # @return Hash
    def retrieve_response(url)
      response = response(url)
      response = response(url) unless response[:code].present?
      response
    end

    # Do check status via http request
    # @return Hash
    def response(url)
      result = {}
      response = RestClient.get(url, headers={})
      result[:headers] = response.try(:headers)
      result[:code] = response.try(:code)
      result[:body] = response.try(:body)

    rescue SocketError => e
      Rails.logger.debug "#{e.to_s}"
    rescue RuntimeError => e
      Rails.logger.debug "#{e.to_s}"
      result[:code] = find_code e.to_s
    ensure
      return result
    end

    def find_code str
      r = str.scan(/^([\d]+).*/)[0][0]
      p "ST #{r}"
      r
    end
  end
end