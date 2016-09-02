#all works in shared library
get '/works' do
  erb :'/works/index'
end

#add a new work to the library
#eventually new work and new publication

#Work details page
get '/works/:id' do
  erb :'/works/show'
end