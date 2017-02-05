get '/' do
  @libraries  = Library.all

  erb :index
end




