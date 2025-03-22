class Public::UsersController < ApplicationController
  def mypage
    @user = current_user
    @books = @user.books.all
    @book = Book.new
  end

  def index
    @book = Book.new
    @books = Book.all
    @user = current_user
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @books = @user.books
  end

  def edit
    user = User.find(params[:id])
    unless user.id == current_user.id
      redirect_to user_path(current_user.id)
    end
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "successfully"
      redirect_to users_mypage_path
    else
      flash.now[:notice] = "error"
      render :edit
    end
  end

  def confirm
  end

  def quit
    @user = User.find(params[:id])
    @user.update(is_active: false)
    reset_session
    flash[:notice] = "退会処理を実行しました"
    redirect_to root_path
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :introduction, :profile_image, :email)
  end

end
