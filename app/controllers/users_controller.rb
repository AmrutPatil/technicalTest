class UsersController < ApplicationController
  def create
    parameters = { client_id: $CLIENT_ID, client_secret: $CLIENT_SECRET }
    emailAvailability = ApplicationHelper::RequestHelper.get('api/v1/users/email', parameters.merge!({email: params[:Email]}))
    if emailAvailability['message'] == 'Success' && !emailAvailability['data']['available'] 
      raise Exception.new('User with this email already present!')
    end  
    parameters[:user] = {
      first_name: params[:FirstName],
      last_name: params[:LastName],
      password: params[:Password],
      email: params[:Email],
      image_url: 'https://static.thenounproject.com/png/961-200.png'
    }
    @res = ApplicationHelper::RequestHelper.post('api/v1/users', parameters )
  rescue Exception => e
    @res = { 'message' => e.message }
  ensure
    respond_to do |format|
      format.js
    end  
  end

  def update
    parameters = { client_id: $CLIENT_ID, client_secret: $CLIENT_SECRET }
    parameters[:user] = {
      first_name: params[:FirstName],
      last_name: params[:LastName],
      date_of_birth: params[:DOB] ? params[:DOB].to_i : nil,
      image_url: 'https://static.thenounproject.com/png/961-200.png'
    }
    @res = ApplicationHelper::RequestHelper.put('api/v1/users/me', parameters, { authorization: session[:access_token] })
  rescue Exception => e
    @res = { 'message' => e.message }
  ensure
    respond_to do |format|
      format.js
    end  
  end

  def change_password
    parameters = { client_id: $CLIENT_ID, client_secret: $CLIENT_SECRET }
    parameters[:user] = {
      current_password: params[:OldPassword],
      new_password: params[:NewPassword],
    }
    @res = ApplicationHelper::RequestHelper.post('api/v1/users/me/password', parameters, { authorization: session[:access_token] })
    session[:access_token] = nil if @res['message'] == 'Success'
  rescue Exception => e
    @res = { 'message' => e.message }
  ensure
    respond_to do |format|
      format.js
    end  
  end
end
