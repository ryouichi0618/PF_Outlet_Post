class Public::PostAnsewersController < Public::ApplicationController

  def create
    post = Post.find(params[:post_id])
    ansewer = current_customer.ansewers.new(ansewer_params)
    ansewer.post_id = post.id
    ansewer.save
    redirect_to post_path(post)
  end


  def edit
    @post = Post.find(params[:post_id])
    @ansewer = Ansewer.find_by(id: params[:id], post_id: params[:post_id])
  end

  def update
    ansewer = Ansewer.find_by(id: params[:id], post_id: params[:post_id])
    ansewer.update(ansewer_params)
    redirect_to post_path(params[:post_id])
  end

  def destroy
    Ansewer.find_by(id: params[:id], post_id: params[:post_id]).destroy
    redirect_to post_path(params[:post_id])
  end

  def best
    ansewer = Ansewer.find_by(id: params[:id], post_id: params[:post_id])
    ansewer.update(ansewer_params)
    post = Post.find(params[:post_id])
    post.best_ansewer = true
    redirect_to post_path(params[:post_id])
  end

  private

  def ansewer_params
    params.require(:ansewer).permit(:body, :parent_id, :best_ansewer)
  end
end
