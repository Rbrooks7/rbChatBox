class TopicsController < ApplicationController
    
    def index
      @topics = Topic.paginate(page: params[:page], per_page: 5)
    end
    
    def show
      @topic = Topic.find(params[:id])
    end
    
    def new
      @topic = Topic.new
    end
    
    def create
      @topic = Topic.new(topic_params)
      @topic.coach = current_user
      
      if @topic.save
        flash[:success] = "Your post was created successfully"
        redirect_to topics_path
      else
        render :new 
        flash[:warning] = "Oops! something went bad wrong"
      end
    end
    
    def edit
      @topic = Topic.find(params[:id])
    end
    
    def update
      @topic = Topic.find(params[:id])
      if @topic.update(topic_params)
        #do something
        flash[:success] = "Your post was updated successfully!"
        redirect_to topic_path(@topic)
      else
        render :edit
      end
    end
    
    def like 
      @topic = Topic.find(params[:id])
      like = Like.create(like: params[:like], coach: Coach.first, topic: @topic)
      if like.valid?
        flash[:success] = "Your selection was successful"
      else
        flash[:danger] = "You can only like/dislike a post once"
      end
      redirect_to :back
    end
    
    
    private
      def topic_params
        params.require(:topic).permit(:title, :body, :picture)
      end
end