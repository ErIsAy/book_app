class DashboardController < ApplicationController
  respond_to :html, :json
  def index
    @user = current_user
    @books = MyBook.all.order(:created_at)
    @read_books = ReadBook.all.order(:created_at)
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
