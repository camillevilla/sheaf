#all works in shared library
get '/works' do
  @works = Work.all
  erb :'/works/index'
end

#new works form
get '/works/new' do 
  erb :'/works/new'
end

#add a new work to the library
post '/works' do
  @work = Work.create(params[:work])
  @id = Work.last.id
  redirect "/works/#{@id}"
end
#eventually new work and new publication

#Work details page
get '/works/:id' do
  @work = Work.find(params[:id])
  @publications = Work.find(params[:id]).publications
  @copies = Work.find(params[:id]).owns
  @owners = User.all
  erb :'/works/show'
end

get '/works/:id/publications' do
  @work = Work.find(params[:id])
  @publications = @work.publications
  erb :'/publications/index'
end

get '/works/:id/publications/new' do
  @work = Work.find(params[:id])
  erb :'/publications/new'
end

post '/works/:id/publications' do
  @publication = Publication.new(params[:publication])
  @publication.work_id = params[:id]
  if @publication.save
    redirect "/works/#{params[:id]}/publications"
  else
    redirect "/works/#{params[:id]}/publications/new"
  end
end

post '/works/:work_id/publications/:publication_id/copies' do
  @publication = Publication.find(params[:publication_id])
  @copy = Own.create(
    user_id: session[:id],
    publication_id: @publication.id
  )
  redirect "/works/#{params[:work_id]}"
end