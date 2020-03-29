class DashboardController < ApplicationController
  def get_widgets
    parameters = {}
    parameters[:term] = params[:term] unless params[:term].nil?
    @myWidgets = false

    token = ApplicationHelper::getToken(session)
    if token
      res = ApplicationHelper::RequestHelper.request('get', 'api/v1/users/me', {}, { authorization: token })
      @user = res['data']['user']
      @myWidgets = !!params[:my_widgets]
    end

    if token && @myWidgets
      res = ApplicationHelper::RequestHelper.request('get', 'api/v1/users/me/widgets', parameters, { authorization: token })
    elsif params[:user_id]
      res = ApplicationHelper::RequestHelper.request('get', "api/v1/users/#{params[:user_id]}", {}, { authorization: token })
      @otherUser = res['data']['user']
      res = ApplicationHelper::RequestHelper.request('get', "api/v1/users/#{params[:user_id]}/widgets", parameters, { authorization: token })
    else
      res = ApplicationHelper::RequestHelper.request('get', 'api/v1/widgets/visible', parameters)  
    end
    @widgets = res['data']['widgets']

    respond_to do |format|
      format.html
      format.js { render 'dashboard/search_widgets' }
    end
  end
end
