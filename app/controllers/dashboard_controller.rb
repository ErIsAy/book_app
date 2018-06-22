class DashboardController < ApplicationController
  respond_to :html, :json
  def index
    @user = current_user
    @books = MyBook.all.order(:created_at)
    @read_books = ReadBook.all.order(:created_at)
  end

  def update
    @read_books = ReadBook.find(params[:id])
    # @read_books.update_attributes(params[:id])
    @read_books.update(read_books_params)
    respond_with @read_books
  end

  private
  def read_books_params
    params.require(:read_books).permit(:status)
  end
end
