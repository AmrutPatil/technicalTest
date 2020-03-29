class AuthenticationController < ApplicationController
  def login
    parameters = { grant_type: "password", username: params[:Email], password: params[:Password] }
    @res = ApplicationHelper::RequestHelper.request('post', 'oauth/token', parameters)
    if @res['message'] == 'Success'
      session[:access_token] = @res['data']['token']['access_token']
      session[:access_token_expires_at] = Time.now + @res['data']['token']['expires_in']
      session[:refresh_token] = @res['data']['token']['refresh_token']
    end
  rescue Exception => e
    @res = { 'message' => e.message }
  ensure
    respond_to do |format|
      format.js
    end
  end

  def logout
    res = ApplicationHelper::RequestHelper.request('post', 'oauth/revoke', 
      { token: session[:access_token] }, 
      { authorization: ApplicationHelper::getToken(session) }
    )
    ApplicationHelper::removeToken(session)
    respond_to do |format|
      format.js
    end
  end
end
