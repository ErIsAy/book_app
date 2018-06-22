class HomeController < ApplicationController

  def index
    @books = BookHistory.order("RANDOM()").limit(3)

    # if admin_signed_in?
    #  return redirect_to dashboard_path
    # end

  end

end
