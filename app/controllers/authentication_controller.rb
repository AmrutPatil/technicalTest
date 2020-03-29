class AuthenticationController < ApplicationController
  def login
    parameters = { client_id: $CLIENT_ID, client_secret: $CLIENT_SECRET }
    parameters[:grant_type] = "password"
    parameters[:username] = params[:Email]
    parameters[:password] = params[:Password]
    @res = ApplicationHelper::RequestHelper.post('oauth/token', parameters)
    session[:access_token] = @res['data']['token']['access_token'] if @res['message'] == 'Success'
  rescue Exception => e
    @res = { 'message' => e.message }
  ensure
    respond_to do |format|
      format.js
    end
  end

  def logout
    res = ApplicationHelper::RequestHelper.post('oauth/revoke', { token: session[:access_token] }, { authorization: session[:access_token] })
    session[:access_token] = nil
    respond_to do |format|
      format.js
    end
  end
end
