class DashboardController < ApplicationController
  def get_widgets
    parameters = { client_id: $CLIENT_ID, client_secret: $CLIENT_SECRET }
    parameters[:term] = params[:term] unless params[:term].nil?
    @myWidgets = false
    if session[:access_token]
      res = ApplicationHelper::RequestHelper.get('api/v1/users/me', {}, { authorization: session[:access_token] })
      @user = p res['data']['user']
      @myWidgets = !!params[:my_widgets]
    end
    if session[:access_token] && @myWidgets
      res = ApplicationHelper::RequestHelper.get('api/v1/users/me/widgets', parameters, { authorization: session[:access_token] })
    else
      res = ApplicationHelper::RequestHelper.get('api/v1/widgets/visible', parameters)  
    end
    @widgets = res['data']['widgets']
    respond_to do |format|
      format.html
      format.js { render 'dashboard/search_widgets' }
    end
  end
end
