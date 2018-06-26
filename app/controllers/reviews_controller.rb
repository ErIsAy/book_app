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
#        @user = User.find(params[current_user.id])
        @review = Review.find(params[:id])
    end
    
    def show
        @book_history = BookHistory.find(params[:book_history_id])
#        @user = User.find(params[current_user.id])
        @review = Review.find(params[:id])
    end
    
    def update
        review = Review.find(params[:id])
        review.update(review_params)
        flash[:success] = 'Your review has been updated'
        redirect_to review_path
    end 
    
    def destroy
        review = Review.find(params[:id])
        review.destroy
        
        
    end
    
    
    private
    def review_params
        # {comment: '123'} + {user_id: '111'} = {comment: '123', user_id: 111}
        params.require(:review).permit(:comment) # {comment: '123'}
    end
    
    
end
