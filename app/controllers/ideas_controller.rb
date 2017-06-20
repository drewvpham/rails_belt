class IdeasController < ApplicationController
  before_action :user_authorized
    def new
      @idea=Idea.new
    end
    def index
      @user=User.find(session[:user_id])
      @ideas=Idea.includes(:likes)
      @ideas_liked_ids = @user.ideas_liked_ids
    end

    def create
      @user=User.find(session[:user_id])
      @idea=Idea.create(idea_params.merge(user:@user))
      redirect_to :back
    end

    def destroy
      Idea.find(params[:id]).destroy
      redirect_to :back

    end

    def show
      @idea=Idea.find(params[:id])
    end

    private
      def idea_params
        params.require(:idea).permit(:content)
      end
  end
