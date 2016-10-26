class Emails::ClayTableMailer < ApplicationMailer

  # @param url_test_result UrlTestResult
  def status_check_fail user, url_test_result
    url_test = url_test_result.url_test

    mail to: user.email,
         subject: "Error on #{url_test.url}",
         body: "#{url_test.url} responds with #{url_test_result.response_code} code at #{l(url_test_result.created_at)}"
  end
end
