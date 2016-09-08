# All publications of work
get '/works/:id/publications' do
  @work = Work.find(params[:id])
  @publications = @work.publications
  erb :'/publications/index'
end

# New publication form
get '/works/:id/publications/new' do
  @work = Work.find(params[:id])
  erb :'/publications/new'
end

# Add a new publication
post '/works/:id/publications' do
  @publication = Publication.new(params[:publication])
  @publication.work_id = params[:id]
  if @publication.save
    redirect "/works/#{params[:id]}/publications"
  else
    redirect "/works/#{params[:id]}/publications/new"
  end
end