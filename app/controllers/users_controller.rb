# All users page
get '/users' do
  erb :'/users/index'
end

# New user registration
get '/users/new' do
  erb :'/users/new'
end

# Create new user
post '/users' do
  # p params
  # params[:password_confirmation]
  # params[:user][:password_hash]
  if params[:password_confirmation] == params[:user][:password_hash]
    @user = User.new(params[:user])
    @user.password = params[:password]
    if @user.save
      session[:id] = @user.id
      # redirect to user profile after registration
      redirect "/users"
    else
      @errors = @user.errors.full_messages    
      redirect :'users/new'
    end 
    else
      @errors = %w[Passwords\ do\ not\ match!]
      redirect :'users/new'
  end
end

