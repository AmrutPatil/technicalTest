require 'rest-client'
require 'mocked_api.rb' if Rails.env.test?

module ApplicationHelper
  
  class RequestHelper
    
    def self.request(method, url, params={}, headers = {})
      return MockedApi.request(method, url) if Rails.env.test?
      res = RestClient::Request.execute(
        method: method,
        url: "#{$API}#{url}",
        headers: headers[:authorization] ? { "Authorization" => "Bearer " + headers[:authorization] } : nil,
        payload: params.merge!({ client_id: $CLIENT_ID, client_secret: $CLIENT_SECRET })
      )
      JSON.parse(res.body)
    end

  end

  def self.getToken(session)
    if session[:access_token] && session[:access_token_expires_at] && session[:access_token_expires_at] < Time.now
      return session[:access_token]
    elsif session[:refresh_token]
      parameters = { client_id: $CLIENT_ID, client_secret: $CLIENT_SECRET }
      parameters[:grant_type] = "refresh_token"
      parameters[:refresh_token] = session[:refresh_token]
      res = ApplicationHelper::RequestHelper.request('post', 'oauth/token', parameters)
      if res['message'] == 'Success'
        session[:access_token] = res['data']['token']['access_token']
        session[:access_token_expires_at] = Time.now + res['data']['token']['expires_in']
        session[:refresh_token] = res['data']['token']['refresh_token']
        return session[:access_token]
      end
    end
    return false
  end

  def self.removeToken(session)
    session[:access_token] = nil
    session[:access_token_expires_at] = nil
    session[:refresh_token] = nil
  end

end
