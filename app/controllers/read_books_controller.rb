class ReadBooksController < ApplicationController
    def index
       @read_books = ReadBook.all 
    end
#    
#    def destroy
##        ReadBook.destroy(params[:id])
##        render json: {status: 'boom success', message: 'Read book was successfully deleted'}
##        
#    end
end
