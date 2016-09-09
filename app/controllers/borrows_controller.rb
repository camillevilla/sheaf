# view all books BORROWED by a user
get '/users/:id/borrows' do
  @borrowed_books = User.find(params[:id]).borrows
  if request.xhr?
    erb :'borrows/_books_borrowed', layout: false, locals: { borrowed_books: @borrowed_books }
  else
    erb :'borrows/_books_borrowed', layout: true, locals: { borrowed_books: @borrowed_books }
  end
end

# view all books LENT by a user
get '/users/:id/books-lent' do
  @lent_books = Borrow.where(own_id: params[:id] )
  if request.xhr?
    erb :'borrows/_books_lent', layout: false, locals: { lent_books: @lent_books } 
  else
    erb :'borrows/_books_lent', layout: true, locals: { lent_books: @lent_books }
  end
end

# form for new borrow request
get '/owns/:id/borrows/new' do 
  @copy = Own.find(params[:id])
  @publication = @copy.publication
  @work = @publication.work
  @owner = @copy.user
  @borrower = User.find(session[:id])
  erb :'/borrows/new'
end 

#send SMS borrow request
post '/owns/:id/borrows/sms-request' do
  @owner = Own.find(params[:id]).user
  to = @owner.phone_number
  message = params[:request]

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