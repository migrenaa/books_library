post '/book' do
  book = Book.new(title: params[:title], author: params[:author], genre: params[:genre], description: params[:description])

  if(book.save)
    flash[:success] = 'Book saved.'
  else
    flash[:error] = "There is an error: #{book.errors.full_message.to_sentence}"
  end
  redirect '/'
end

get '/books' do
  @book = Books.find(params[:id])

  erb :book
end

get '/books' do
  @book = Books.all.find_all {|b| b.name == (params[:name])}

  erb :index
end

get 'books' do
  @books = Book.all.find_all {|b| b.genre == params[:genre]}

  erb :index
end

get '/books' do
  @books = Book.all.find_all {|b| b.description == params[:description]}

  erb :index
end

delete '/books' do
  book = Book.delete(params[:id])

  erb :index
end



