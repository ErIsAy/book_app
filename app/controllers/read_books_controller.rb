class ReadBooksController < ApplicationController
  def index
  end

  def destroy
    MyBook.destroy(params[:id])
    render json: { status: 'boom success', message: 'Read book was successfully deleted' }
  end
end
