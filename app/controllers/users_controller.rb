class UsersController < ApplicationController

  def user
    res = ApplicationHelper::RequestHelper.request('get', "api/v1/users/#{params[:id]}", {}, { authorization: ApplicationHelper::getToken(session) })
    @user = res['data']['user']
    respond_to do |format|
      format.js
    end
  end

  def create
    emailAvailability = ApplicationHelper::RequestHelper.request('get', 'api/v1/users/email', {email: params[:Email]})
    if emailAvailability['message'] == 'Success' && !emailAvailability['data']['available'] 
      raise Exception.new('User with this email already present!')
    end  
    parameters = { user: {
      first_name: params[:FirstName],
      last_name: params[:LastName],
      password: params[:Password],
      email: params[:Email],
      image_url: 'https://static.thenounproject.com/png/961-200.png'
    } }
    @res = ApplicationHelper::RequestHelper.request('post', 'api/v1/users', parameters )
  rescue Exception => e
    @res = { 'message' => e.message }
  ensure
    respond_to do |format|
      format.js
    end  
  end

  def update
    parameters = {user: {
      first_name: params[:FirstName],
      last_name: params[:LastName],
      date_of_birth: params[:DOB] ? params[:DOB].gsub('-','').to_i : nil,
      image_url: 'https://static.thenounproject.com/png/961-200.png'
    } }
    @res = ApplicationHelper::RequestHelper.request('put', 'api/v1/users/me', parameters, { authorization: ApplicationHelper::getToken(session) })
  rescue Exception => e
    @res = { 'message' => e.message }
  ensure
    respond_to do |format|
      format.js
    end  
  end

  def change_password
    parameters = { user: {
      current_password: params[:OldPassword],
      new_password: params[:NewPassword],
    } }
    @res = ApplicationHelper::RequestHelper.request('post', 'api/v1/users/me/password', parameters, { authorization: ApplicationHelper::getToken(session) })
    ApplicationHelper::removeToken(session) if @res['message'] == 'Success'
  rescue Exception => e
    @res = { 'message' => e.message }
  ensure
    respond_to do |format|
      format.js
    end  
  end

  def reset_password
    parameters = { user: { email: params[:resetPasswordEmail] } }
    @res = ApplicationHelper::RequestHelper.request('post', 'api/v1/users/reset_password', parameters)
  rescue Exception => e
    @res = { 'message' => e.message }
  ensure
    respond_to do |format|
      format.js
    end
  end
end
