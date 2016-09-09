# Add a new copy 
post '/works/:work_id/publications/:publication_id/owns' do
  @publication = Publication.find(params[:publication_id])
  @copy = Own.create(
    user_id: session[:id],
    publication_id: @publication.id
  )
  redirect "/works/#{params[:work_id]}"
end

