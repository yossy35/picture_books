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
    @books = params[:genre_id].present? ? Genre.find(params[:genre_id]).books : Book.all
  end

  private
  
  def book_params
    params.require(:book).permit(:isbn, :image, :title, :author_name, :review, :star,genre_ids: [])
  end
end
