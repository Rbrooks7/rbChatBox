class PagesController < ApplicationController
    
    def home
      redirect_to topics_path if logged_in?
    end
    
    
end