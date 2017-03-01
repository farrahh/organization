Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


get 'admin/show'

get '/' =>'users#index'

get '/show'=>'admin#show'

post '/create' => 'users#create'


post '/login' => 'users#login'

get '/logout' => 'users#logout'

get '/dashboard' => 'users#dashboard'


# ^^^^^^^^^Login/Reg^^^^^^^^

post '/group_create' => 'users#group_create'

get '/groups/:id' => 'users#group_info'

post '/destroy/dashboard/:id' => 'users#destroy_dashboard'

post '/join/:id' => 'users#join'

post '/unjoin/:id' => 'users#unjoin'








end
