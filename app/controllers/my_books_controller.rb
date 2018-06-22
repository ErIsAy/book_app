class MyBooksController < ApplicationController
 # before_action :authenticate_user!
 #  skip_before_action :verify_authenticity_token, only: [:destroy]
    
   def index
     @my_books = MyBook.all
   end

 #  def destroy
 #    MyBook.destroy(params[:id])
 #  end
    
    def create_from_book_history
        book_history = BookHistory.find(params[:book_history_id])
        MyBook.create(
            title: book_history.title,
            author: book_history.author,
            description: book_history.description,
            image_url: book_history.image_url,
            isbn: book_history.isbn

        )
        redirect_to search_path
    end

end
