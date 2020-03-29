class MockedApi

  @@data = [
    { 
      method: 'get',
      url: 'api/v1/users/me',
      data: {"message"=>"Success", "data"=>{"user"=>{"id"=>1, "name"=>"Amrut Patil", "images"=>{"small_url"=>"https://showoff-rails-react-api-production.s3.amazonaws.com/users/images/000/003/906/small/961-200.png?1585489568"}, "first_name"=>"Amrut", "last_name"=>"Patil", "date_of_birth"=>0, "email"=>"patil.amrut179@gmail.com", "active"=>true}}}
    },
    { 
      method: 'get',
      url: 'api/v1/users/me/widgets',
      data: {"message"=>"Success", "data"=>{"widgets"=>[{"id"=>2085, "name"=>"new visible", "description"=>"new description", "kind"=>"visible", "user"=>{"id"=>3906, "name"=>"Amrut Patil", "images"=>{"small_url"=>"https://showoff-rails-react-api-production.s3.amazonaws.com/users/images/000/003/906/small/961-200.png?1585489568"}, "first_name"=>"Amrut", "last_name"=>"Patil", "date_of_birth"=>0, "email"=>"patil.amrut179@gmail.com", "active"=>true}, "owner"=>true}]}}
    },
    { 
      method: 'get',
      url: 'api/v1/users/1',
      data: {"message"=>"Success", "data"=>{"user"=>{"id"=>1, "name"=>"Amrut Patil", "images"=>{"small_url"=>"https://showoff-rails-react-api-production.s3.amazonaws.com/users/images/000/003/906/small/961-200.png?1585489568"}, "first_name"=>"Amrut", "last_name"=>"Patil", "date_of_birth"=>0, "email"=>"patil.amrut179@gmail.com", "active"=>true}}}
    },
    { 
      method: 'get',
      url: 'api/v1/users/1/widgets',
      data: {"message"=>"Success", "data"=>{"widgets"=>[{"id"=>2085, "name"=>"new visible", "description"=>"new description", "kind"=>"visible", "user"=>{"id"=>3906, "name"=>"Amrut Patil", "images"=>{"small_url"=>"https://showoff-rails-react-api-production.s3.amazonaws.com/users/images/000/003/906/small/961-200.png?1585489568"}, "first_name"=>"Amrut", "last_name"=>"Patil", "date_of_birth"=>0, "email"=>"patil.amrut179@gmail.com", "active"=>true}, "owner"=>true}]}}
    },
    { 
      method: 'get',
      url: 'api/v1/widgets/visible',
      data: {"message"=>"Success", "data"=>{"widgets"=>[{"id"=>2085, "name"=>"new visible", "description"=>"new description", "kind"=>"visible", "user"=>{"id"=>3906, "name"=>"Amrut Patil", "images"=>{"small_url"=>"https://showoff-rails-react-api-production.s3.amazonaws.com/users/images/000/003/906/small/961-200.png?1585489568"}, "first_name"=>"Amrut", "last_name"=>"Patil", "date_of_birth"=>0, "email"=>"patil.amrut179@gmail.com", "active"=>true}, "owner"=>true}]}}
    },
    { 
      method: 'post',
      url: 'oauth/token',
      data: {"message"=>"Success", "data"=>{"token"=>{"access_token"=>"209eae139db663de021952ef5970e5f3e0f88a1057bf9b1f8f1cd24419caf1a3", "token_type"=>"Bearer", "expires_in"=>2592000, "refresh_token"=>"465a407817c439e5c2d84edc7b71239800be2730d7bbb91ffe2dd85b03bf7e2c", "scope"=>"basic", "created_at"=>1585498297}}}
    },
    { 
      method: 'post',
      url: 'oauth/revoke',
      data: {"message"=>"Success"}
    }
  ]

  def self.request(method, url)
    return @@data.select{ |x| x[:method] == method && x[:url] == url }.first[:data]
  end
end