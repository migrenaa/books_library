use Rack::Session::Pool, :expire_after => 2592000

post '/register' do
  if User.find_each {|u| u.username == params[:username]} != nil
    user = User.new(username: params[:username], password: params[:password], name: params[:name])
    user.save
    session["username"] = params[:username]
  end

  erb :registration
end

post '/login' do
  isAuthenticated? params[:username], params[:password]
  session["username"] = username
end

def isAuthenticated? username, password
  user.find_each {|u| u.username == username and u.password == password}
end

post '/book' do
  @user = User.find_all{|u| u.username == session[:username]}
  book_in_library = BooksInLibrary.find_all{|b| b.library_id == params[:library_id] and b.book_id == params[:book_id]}
  @user_book = Users_books.new(book_in_library_id: book_in_library.id_, user_id: params[:user_id], date_taken: DateTime.now,
                               date_to_return: params[:date_to_return])
  if book_in_library > 0 then @user_book.save else "Blq" end
  book_in_library.count--
  book_in_library.save
end
