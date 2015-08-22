class CoachesController < ApplicationController
    
    def new
      @coach = Coach.new
    end
    
    def create 
      @coach = Coach.new(coach_params)
      if @coach.save
        flash[:success] = "Your account was created"
        redirect_to topics_path
      else
        render  'new'
      end
    end
    
    def edit
        
    end
    
    def update
        
    end
    
    private
      def coach_params
        params.require(:coach).permit(:coachname, :email, :password)
      end
    
end