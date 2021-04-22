class Admin::PostAnsewersController < ApplicationController

  def destroy
    @post = Post.find(params[:post_id])
    if Ansewer.find_by(id: params[:id], post_id: params[:post_id]).destroy
    else
      flash[:alert] = "削除に失敗しました。"
      redirect_to admin_post_path(params[:post_id])
    end
  end
end
