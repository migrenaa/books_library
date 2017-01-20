get '/books' do
  @books = Book.all

  erb :index
end

post '/book' do
  book = Book.new(title: params[:title], author: params[:author], gender: params[:gender], description: params[:description])

  if(book.save)
    flash[:success] = 'Book saved.'
  else
    flash[:error] = "There is an error: #{book.errors.full_message.to_sentence}"
  end
  redirect '/'
end



