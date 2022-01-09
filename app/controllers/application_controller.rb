class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  
  # Add your routes here
  get "/" do
    { message: "Good luck with your project!" }.to_json
  end

  get "/books" do 
    books = Book.all
    # books.to_json(only: [:title])
    books.to_json(include: :author)
  end

  post '/books' do 
    # todo
    book = Book.create(title: params[:title],author_id: params[:author_id], category_id: params[:category_id] )
    book.to_json
  end

  delete '/books/:id' do 
    book = Book.find(params[:id])
    book.destroy 
  end
  
  get "/authors/:id" do 
    author = Author.find(params[:id])
    # book.to_json
    author.to_json(include: {books: {include: :category}})
  end

  get "/authors" do 
    authors = Author.all 
    authors.to_json
  end

  get '/categories' do 
    categories = Category.all 
    categories.to_json
  end
 
end
