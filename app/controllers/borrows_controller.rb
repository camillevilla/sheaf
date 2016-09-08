get '/owns/:id/borrows/new' do 
  @copy = Own.find(params[:id])
  @publication = @copy.publication
  @work = @publication.work
  @owner = @copy.user
  @borrower = User.find(session[:id])
  erb :'/borrows/new'
end 

post '/owns/:id/borrows/sms-request' do
  @owner = Own.find(params[:id]).user
  to = @owner.phone_number
  message = params[:request]
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

  # eventually redirect to a nicer success page
  redirect "/users/#{session[:id]}"
end