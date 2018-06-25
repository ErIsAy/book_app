class SearchController < ApplicationController
  def index
  end

#    def search
#          pathname = CGI::escape(params[:search])
#          redirect_to search_index_path(pathname)
#    end
#
#    def results
#        def titleize(str)
#            str.split(/ |\_/).map(&:capitalize).join(" ")
#        end
#
#        @decoded_input = titleize(CGI::unescape(params[:encoded_input]))
#        books = GoogleBooks.search(@decoded_input)
#        @b_title = books.first.title
#        @b_author = books.first.authors
#        @b_img_link = books.first.image_link
#    end


  def search
      google_books = GoogleBooks.search(params[:search]).first(3)

      @books = [];


      google_books.each do |book|
        # next if BookHistory.where(isbn: book.isbn).present?
        book_history = BookHistory.create(
          title: book.title,
          author: book.authors,
          description: book.description,
          image_url: book.image_link,
          isbn: book.isbn
        )
        @books << book_history
      end
      render :index
  end

  def destroy
    ReadBook.destroy(params[:id])
    render json: {status: 'success', message: 'Book was successfully removed'}
  end


  # my_books_controller
   def create_from_book_history


   end

end
