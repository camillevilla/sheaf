get '/students' do
  erb :'students/index'
end


get '/students/new' do
  erb :'students/new'
end


post '/students' do
  # list = params[:word_list]
  # p "#{list}"
  p "#{params[:word_list]}"

end

get '/students/:id' do

  #your code here

end

get '/students/:id/edit' do

  #your code here

end

put '/students/:id' do

  #your code here

end

delete '/students/:id' do

  #your code here

end
