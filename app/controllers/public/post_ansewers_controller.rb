class Public::PostAnsewersController < Public::ApplicationController

  def create
    post = Post.find(params[:post_id])
    ansewer = current_customer.ansewers.new(ansewer_params)
    ansewer.post_id = post.id
    if ansewer.save
      flash[:notice] = "回答しました。"
      redirect_to post_path(post)
    else
      flash[:alert] = "投稿に失敗しました。"
      redirect_to post_path(post)
    end
  end


  def edit
    @post = Post.find(params[:post_id])
    @ansewer = Ansewer.find_by(id: params[:id], post_id: params[:post_id])
  end

  def update
    ansewer = Ansewer.find_by(id: params[:id], post_id: params[:post_id])
    if ansewer.
    if ansewer.update(ansewer_params)
      flash[:notice] = "内容が更新されました。"
      redirect_to post_path(params[:post_id])
    else
      flash[:alert] = "編集に失敗しました。"
      @post = Post.find(params[:post_id])
      @ansewer = Ansewer.find_by(id: params[:id], post_id: params[:post_id])
      render :edit
    end
  end

  def destroy
    if Ansewer.find_by(id: params[:id], post_id: params[:post_id]).destroy
      flash[:notice] = "内容を削除しました。"
      redirect_to post_path(params[:post_id])
    else
      flash[:alert] = "削除に失敗しました。"
      redirect_to post_path(params[:post_id])
    end
  end


  private

  def ansewer_params
    params.require(:ansewer).permit(:body, :parent_id, :best_ansewer)
  end
end
