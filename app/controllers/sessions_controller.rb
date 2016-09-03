#Login form
get '/sessions/new' do
  erb :'/sessions/new'
end

#User login
post '/sessions' do 
  @user  = User.find_by_email(params[:user][:email])
  p @user
  p @user.password
  p @user.password_hash
  # how to get this all hashy?!?!
  p params[:user][:password_hash] # = "mew"
  p @user.password == params[:user][:password_hash]
  # p @user.password_hash == params[:user][:password_hash]
  if @user.password == params[:user][:password_hash]
    session[:id] = @user.id
    # redirect to user profile after login
    redirect "/users/#{@user.id}"
  else
    redirect "/sessions/new"
  end
end

#Logout
delete '/sessions' do
  session[:id] = nil
  redirect '/'
end