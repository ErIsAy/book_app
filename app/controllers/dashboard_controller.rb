class DashboardController < ApplicationController
  def index
    @user = current_user
    @books = MyBook.all.order(:created_at)
    @read_books = ReadBook.all.order(:created_at)
  end
end
