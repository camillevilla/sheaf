# All works 
get '/works' do
  @works = Work.all
  erb :'/works/index'
end

# new works form
get '/works/new' do 
  erb :'/works/new'
end

# add a new work
post '/works' do
  @work = Work.create(params[:work])
  @id = Work.last.id
  redirect "/works/#{@id}"
end

#Work details page
get '/works/:id' do
  @work = Work.find(params[:id])
  @publications = Work.find(params[:id]).publications
  @copies = Work.find(params[:id]).owns
  @owners = User.all
  @current_user = User.find(session[:id])
  erb :'/works/show'
end