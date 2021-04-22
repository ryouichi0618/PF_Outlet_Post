class Public::FavoritesController < ApplicationController

  before_action :post_find

  def create
    @post = Post.find(params[:post_id])
    favorite = current_customer.favorites.new(post_id: @post.id)
    favorite.save
    # render template: 'favorites/create'
    render :create

  end

  def destroy
    @post = Post.find(params[:post_id])
    favorite = current_customer.favorites.find_by(post_id: @post.id)
    favorite.destroy
    # redirect_back(fallback_location: root_path)
    # render template: 'favorites/destroy'
    render :destroy
  end

  private

  def post_find
    @post = Post.find(params[:post_id])
  end
end
