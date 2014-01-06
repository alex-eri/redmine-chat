get '/projects/:project/chat', :to => 'chat#list'
post '/projects/:project/chat', :to => 'chat#new'
