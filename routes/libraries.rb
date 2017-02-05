get '/libraries' do
  @library = Library.find(params[:id]).name
  @books = BooksInLibrary.find_all {|b| b.library_id == [params[:id]]}.books

  erb :library
end

post '/libraries/books' do
  library = Library.find([params[:library_id]])
  book = Book.find([params[:book_id]])

  unless library or book
    books_in_library = BooksInLibrary.new(count: params[:count], book_id: params[:books_id], library_id: params[:library_id])
    books_in_library.save
  end

  erb :library
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