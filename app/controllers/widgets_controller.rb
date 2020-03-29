class WidgetsController < ApplicationController
  def create
    parameters = { client_id: $CLIENT_ID, client_secret: $CLIENT_SECRET }
    parameters[:widget] = {
      name: params[:Name],
      description: params[:Description],
      kind: params[:Type]
    }
    @res = ApplicationHelper::RequestHelper.post('api/v1/widgets', parameters, { authorization: session[:access_token] })
  rescue Exception => e
    @res = { 'message' => e.message }
  ensure
    respond_to do |format|
      format.js
    end
  end

  def update
    parameters = { client_id: $CLIENT_ID, client_secret: $CLIENT_SECRET }
    parameters[:widget] = {
      name: params[:Name],
      description: params[:Description]
    }
    @res = ApplicationHelper::RequestHelper.put("api/v1/widgets/#{params[:id]}", parameters, { authorization: session[:access_token] })
  rescue Exception => e
    @res = { 'message' => e.message }
  ensure
    respond_to do |format|
      format.js
    end
  end

  def delete
    @res = ApplicationHelper::RequestHelper.del("api/v1/widgets/#{params[:id]}", { authorization: session[:access_token] })
  rescue Exception => e
    @res = { 'message' => e.message }
  ensure
    respond_to do |format|
      format.js
    end
  end
end
