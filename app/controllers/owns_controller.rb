get '/owns/:id/borrows/new' do 
  @copy = Own.find(params[:id])
  erb :'/borrows/new'
end 

