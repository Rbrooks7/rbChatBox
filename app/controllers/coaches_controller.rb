class CoachesController < ApplicationController
    
    def index 
      @coaches = Coach.paginate(page: params[:page], per_page: 3)
    end
    
    def new
      @coach = Coach.new
    end
    
    def create 
      @coach = Coach.new(coach_params)
      if @coach.save
        flash[:success] = "Your account was created"
        session[:coach_id] = @coach.id
        redirect_to topics_path
      else
        render  'new'
      end
    end
    
    def edit
      @coach = Coach.find(params[:id])
    end
    
    def update
      @coach = Coach.find(params[:id])
      if @coach.update(coach_params)
        flash[:success] = "Your update was successful"
        redirect_to topics_path #TODO change to show coach page
      else
        render  'edit'
      end
    end
    
    def show
      @coach = Coach.find(params[:id])
      @topics = @coach.topics.paginate(page: params[:page], per_page: 3)
    end
    
    private
      def coach_params
        params.require(:coach).permit(:coachname, :email, :password)
      end
    
end