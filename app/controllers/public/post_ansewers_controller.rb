class Public::PostAnsewersController < Public::ApplicationController
  
  def create
    post = Post.find(params[:post_id])
    ansewer = current_customer.ansewer.new(ansewer_params)
    ansewer.post_id = post.id
    redirect_to post_path(post)
  end
  
  def edit
  end 
  
  def update
  end
  
  def destroy
  end
  
  private
  
  def ansewer_params
    params.require(:ansewer).permit(:body)
  end
end
