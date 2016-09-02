# All users page
get '/users' do
  erb :'/users/index'
end

# New user registration
get '/users/new' do
  erb :'/users/new'
end

# Create new user
post 'users/' do
  # redirect to user profile after registration
  # redirect :"/users/:id"
end