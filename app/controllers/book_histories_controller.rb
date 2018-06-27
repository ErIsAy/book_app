class BookHistoriesController < ApplicationController
  
  def show
    @book = BookHistory.find(params[:id])
    @review = Review.find_by(book_history_id: params[:id])
  end
end
