class WidgetsController < ApplicationController
  def create
    parameters = { widget: { name: params[:Name], description: params[:Description], kind: params[:Type] } }
    @res = ApplicationHelper::RequestHelper.request('post', 'api/v1/widgets', parameters, { authorization: ApplicationHelper::getToken(session) })
  rescue Exception => e
    @res = { 'message' => e.message }
  ensure
    respond_to do |format|
      format.js
    end
  end

  def update
    parameters = { widget: { name: params[:Name], description: params[:Description] } }
    @res = ApplicationHelper::RequestHelper.request('put', "api/v1/widgets/#{params[:id]}", parameters, { authorization: ApplicationHelper::getToken(session) })
  rescue Exception => e
    @res = { 'message' => e.message }
  ensure
    respond_to do |format|
      format.js
    end
  end

  def delete
    @res = ApplicationHelper::RequestHelper.request('delete', "api/v1/widgets/#{params[:id]}", {}, { authorization: ApplicationHelper::getToken(session) })
  rescue Exception => e
    @res = { 'message' => e.message }
  ensure
    respond_to do |format|
      format.js
    end
  end
end
