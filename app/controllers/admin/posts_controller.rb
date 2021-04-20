class Admin::PostsController < ApplicationController
  def index
    @posts = Post.all.page(params[:page]).reverse_order
  end

  def show
    @post = Post.find(params[:id])
  end

  def destroy
    post =Post.find(params[:id])
    if post.destroy
      flash[:notice] = "投稿を削除しました。"
      redirect_to admin_posts_path
    else 
      flash[:alert] = "投稿を削除できませんでした。"
      redirect_to admin_post_path(post)
    end
  end
end
