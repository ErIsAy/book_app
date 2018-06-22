class MyBooksController < ApplicationController
 # before_action :authenticate_user!
 #  skip_before_action :verify_authenticity_token, only: [:destroy]
    
 #  def index
 #    @my_books = MyBook.all
 #  end

 #  def destroy
 #    MyBook.destroy(params[:id])
 #  end

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
    params.require(:my_book).permit(:status)
  end
end

