class Public::SearchesController < ApplicationController
  before_action :authenticate_user!
  
  def search
    @model = params[:model]
    @content = params[:content]
    @method = params[:method]
    
    if @model  == "user"
      @records = User.search_for(@content, @method)
    else
      @records = Book.search_for(@content, @method)
    end
  end

  def genre_search
    if params[:genre_id].present?
      genre = Genre.find(params[:genre_id])
      @books = genre.books
      @word = genre.name
    else
      @books = Book.all
    end
  end
  
end
