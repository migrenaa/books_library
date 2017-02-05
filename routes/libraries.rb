get '/libraries' do
  @libraries = Library.all

  erb :libraries
end

get '/libraries/:id' do
  @library = Library.find(params[:id])

  erb :library
end

get 'libraries/:id/books' do
  @books = Library.find([params[:id]]).books

  erb :index
end



post '/libraries' do
  library = Library.new(name: params[:name], address: params[:address])

  if(library.save)
    flash[:success] = 'library saved.'
  else
    flash[:error] = "There is an error: #{library.errors.full_message.to_sentence}"
  end

  redirect '/'
end