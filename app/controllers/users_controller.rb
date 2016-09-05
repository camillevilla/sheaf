# All users page
get '/users' do
  @users = User.all
  @current_user = User.find(session[:id])
  erb :'/users/index'
end

# New user registration
get '/users/new' do
  erb :'/users/new'
end

# Create new user
post '/users' do
  if params[:password_confirmation] == params[:user][:password_hash]
    @user = User.new(params[:user])
    @user.password = params[:user][:password_hash]
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

get '/users/:id' do
  @current_user = User.find(session[:id])
  @borrowed_books = @current_user.borrows
  @lent_books = Borrow.where(own_id: @current_user.id )
  erb :'/users/show'
end