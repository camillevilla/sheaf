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

# testing out Twilio stuff
post '/send_sms' do
  @user = User.first
  to = @user.phone_number
  message = @user.name
  # to = params["to"]
  # message = params["body"]

  client = Twilio::REST::Client.new(
    ENV["TWILIO_ACCOUNT_SID"],
    ENV["TWILIO_AUTH_TOKEN"]
    )

  client.messages.create(
    to: to,
    from: ENV["TWILIO_PHONE_NUMBER"],
    body: message
    )

end