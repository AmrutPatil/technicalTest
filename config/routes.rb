Rails.application.routes.draw do
  get 'dashboard/get_widgets'

  get 'users/user/:id', :to => 'users#user'
  post 'users/create'
  put 'users/update'
  post 'users/change_password'

  post 'widgets/create'
  put 'widgets/update/:id', :to => 'widgets#update'
  delete 'widgets/delete/:id', :to => 'widgets#delete'

  post 'authentication/login'
  post 'authentication/logout'

  root :to => 'dashboard#get_widgets'
end
