class LikesController < ApplicationController

  def new
  end

  def create
    Like.create(idea: Idea.find(params[:id]), user: current_user)
    redirect_to ideas_path
  end

  def destroy
    Like.find_by(idea: Idea.find(params[:id]), user: current_user).destroy
    redirect_to ideas_path
  end
end
