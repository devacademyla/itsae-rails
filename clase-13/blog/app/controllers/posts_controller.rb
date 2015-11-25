# Class PostsController
class PostsController < ApplicationController
  def index
    render json: Post.all
  end

  def show
    render json: Post.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    render json: 'No existe', status: :not_found
  end
end
