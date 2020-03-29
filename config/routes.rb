Rails.application.routes.draw do
  get 'dashboard/get_widgets'

  post 'users/create'
  put 'users/update'
  post 'users/change_password'

  post 'authentication/login'
  post 'authentication/logout'

  root :to => 'dashboard#get_widgets'
end
