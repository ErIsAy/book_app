class DashboardController < ApplicationController
  before_action :authenticate_user!
  respond_to :html, :json
  def index
    @user = current_user
    @read_books = ReadBook.all.order(:created_at)

    @books = current_user.my_books
  end

  def update
    @my_books = MyBook.find(params[:id])
    # @read_books.update_attributes(params[:id])
    @my_books.update(my_books_params)
    respond_with @my_books
  end

  private

  def my_books_params
    params.require(:my_books).permit(:status)
  end
end
