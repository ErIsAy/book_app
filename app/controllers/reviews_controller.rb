class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def new
    @book_history = BookHistory.find(params[:book_history_id]) 
    @review = Review.new
  end
  
  def create
    book_history = BookHistory.find(params[:book_history_id])
    book_history.reviews.create(review_params.merge(user_id: current_user.id))
    flash[:success] = 'Thank you for adding your review'
    redirect_to book_history_path(id: book_history.id)
  end
  
  def edit 
    @book_history = BookHistory.find(params[:book_history_id])
    @review = Review.find(params[:id])
  end
  
  def update
    review = Review.find(params[:id])
    review.update(review_params)
    flash[:success] = 'Your review has been updated'
    redirect_to book_history_reviews_path
  end

  def show
    @book_history = BookHistory.find(params[:book_history_id])
    @review = Review.find(params[:id])
  end 
  
  def destroy
    review = Review.find(params[:id])
    review.destroy    
  end
  
  
  private
  def review_params
    params.require(:review).permit(:comment)
  end  
end