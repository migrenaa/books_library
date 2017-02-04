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