class HomeController < ApplicationController
  
  def index
    @books = BookHistory.order('RANDOM()').limit(3)
  end
end
