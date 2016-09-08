#Login form
get '/sessions/new' do
  erb :'/sessions/new'
end

#User login
post '/sessions' do 
  @user  = User.find_by_email(params[:user][:email])
  if @user && @user.password == params[:user][:password_hash]
    session[:id] = @user.id
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