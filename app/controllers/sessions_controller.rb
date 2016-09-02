#Login form
get '/sessions/new' do
  erb :'/sessions/new'
end

#User login
post '/sessions' do 
  # redirect to user profile after login
end