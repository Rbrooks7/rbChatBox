class LoginsController < ApplicationController
    
    def new
      
    end
    
    def create 
      coach = Coach.find_by(email: params[:email])
      if coach && coach.authenticate(params[:password])
        session[:coach_id] = coach.id
        flash[:success] = "Login Successful"
        redirect_to topics_path
      else
        flash.now[:danger] = "Your email address or password does not match"
        render 'new'
      end
    end
    
    def destroy
      session[:coach_id] = nil
      flash[:success] = "You are logged out, hasta manana"
      redirect_to root_path
    end
end