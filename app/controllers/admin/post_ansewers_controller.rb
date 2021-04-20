class Admin::PostAnsewersController < ApplicationController

  def destroy
    if Ansewer.find_by(id: params[:id], post_id: params[:post_id]).destroy
      flash[:notice] = "内容を削除しました。"
      redirect_to admin_post_path(params[:post_id])
    else
      flash[:alert] = "削除に失敗しました。"
      redirect_to admin_post_path(params[:post_id])
    end
  end
end
