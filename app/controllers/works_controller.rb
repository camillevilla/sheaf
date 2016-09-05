#all works in shared library
get '/works' do
  @works = Work.all
  erb :'/works/index'
end

#add a new work to the library
#eventually new work and new publication

#Work details page
get '/works/:id' do
  @work = Work.find(params[:id])
  @publications = Work.find(params[:id]).publications
  @copies = Work.find(params[:id]).owns
  @owners = User.all
  erb :'/works/show'
end