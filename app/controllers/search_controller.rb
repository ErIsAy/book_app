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


    # my_books_controller
    # def create_from_book_history
    #   book_history = BookHistory.find(params[:id])
    #   MyBook.create(
    #     name: book_history.name
    #     author: book_history.author
    #     description: book_history.description,
    #     image_url: book_history.image_url,
    #     isbn: book_history.isbn
    #
    #   )
    # end
end
