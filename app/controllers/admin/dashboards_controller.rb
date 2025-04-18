class Admin::DashboardsController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!
  def index
      @users = User.all
      @books = Book.all
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to admin_dashboards_path
  end

end
