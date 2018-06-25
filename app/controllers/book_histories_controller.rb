class BookHistoriesController < ApplicationController
  def show
    @book = BookHistory.find(params[:id])
  end
end
