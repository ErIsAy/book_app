class SearchController < ApplicationController
    def index
    end
    
#    def search
#          pathname = CGI::escape(params[:search])
#          redirect_to search_index_path(pathname)
#    end
#    
#    def results
#        def titleize(str)
#            str.split(/ |\_/).map(&:capitalize).join(" ")
#        end
#
#        @decoded_input = titleize(CGI::unescape(params[:encoded_input]))
#        books = GoogleBooks.search(@decoded_input)
#        @b_title = books.first.title
#        @b_author = books.first.authors
#        @b_img_link = books.first.image_link
#    end
    
    
    def search 
        @books = GoogleBooks.search(params[:search]).first(3)
        render :index
    end
    
end




