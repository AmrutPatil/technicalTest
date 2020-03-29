require 'rest-client'

module ApplicationHelper
  
  class RequestHelper
    
    def self.get(url, params={}, headers = {})
      res = RestClient::Request.execute(
        method: :get,
        url: "#{$API}#{url}",
        headers: headers[:authorization] ? { "Authorization" => "Bearer " + headers[:authorization] } : nil,
        payload: params
      )
      JSON.parse(res.body)
    end

    def self.post(url, params={}, headers = {})
      res = RestClient.post("#{$API}#{url}", params, 
        { "Authorization" => headers[:authorization] ? "Bearer " + headers[:authorization] : nil } 
      )
      JSON.parse(res.body)
    end

    def self.put(url, params={}, headers = {})
      res = RestClient.put("#{$API}#{url}", params, 
        { "Authorization" => headers[:authorization] ? "Bearer " + headers[:authorization] : nil } 
      )
      JSON.parse(res.body)
    end
  end

end
