class UsersController < ApplicationController
  def mypage
    @user = current_user
    @books = @user.books.all
    @book = Book.new
  end

  def index
  end

  def show
  end

  def edit
  end

  def confirm
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image)
  end

end
