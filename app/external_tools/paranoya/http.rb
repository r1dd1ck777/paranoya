# frozen_string_literal: true

require 'net/http'
module Paranoya
  module Http
    API_URL = "http://paranoya.xyz"
    TEST_X_TOKEN = "a89sdhj98ahsd0asdas08dLsdgaf_dasgdua245flls"

    class << self
      # Paranoya::Http.post "/path", payload: { user_id: 1 }
      def post(path, options = {})
        call(:post, path, options)
      end

      # Paranoya::Http.get "/path"
      def get(path, options = {})
        call(:get, path, options)
      end

      def call(type, path, options = {})
        uri = URI.parse(API_URL + path)
        request = create_request(type, uri)
        request.body = options[:payload].to_json if options[:payload]

        get_response(uri, request)
      rescue => e
        Rails.logger.fatal "Error while sending log data. #{e}"
      end

      protected

      def get_response uri, request
        str = client(uri).request(request).body
        JSON.parse(str)
      end

      def create_request(type, uri)
        net_class = {
          post: Net::HTTP::Post,
          get: Net::HTTP::Get,
          delete: Net::HTTP::Delete
        }[type]

        net_class.new(
          uri.request_uri,
          'Content-Type' => 'application/json',
          'X-Token' => TEST_X_TOKEN
        )
      end

      def client(uri)
        http = Net::HTTP.new(uri.host, uri.port)
        # http.use_ssl = true
        # http.verify_mode = OpenSSL::SSL::VERIFY_NONE
        http
      end
    end
  end
end