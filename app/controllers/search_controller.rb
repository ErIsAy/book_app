class SearchController < ApplicationController
  before_action :authenticate_user!

  def index
  end

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

  def create_from_book_history
  end
end
