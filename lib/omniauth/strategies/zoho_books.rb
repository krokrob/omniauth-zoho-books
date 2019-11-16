require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class ZohoBooks < OmniAuth::Strategies::OAuth2
      option :name, "zoho_books"

      option :client_options, {
        site: 'https://accounts.zoho.com',
        authorize_url: '/oauth/v2/auth',
        token_url: '/oauth/v2/token'
      }
      option provider_ignores_state: true
      option :authorize_options, %i[access_type prompt scope]

      uid { raw_info['organizations'].first['organization_id'] }

      info do
        {
          name: raw_info['organizations'].first['name'],
          email: raw_info['organizations'].first['name']
        }
      end

      extra do
        {
          'raw_info' => raw_info
        }
      end

      def raw_info
        @raw_info ||= access_token.get("https://books.zoho.com/api/v3/organizations").parsed
      end
    end
  end
end
