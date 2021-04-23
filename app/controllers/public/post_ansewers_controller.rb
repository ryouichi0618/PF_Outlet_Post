class Public::PostAnsewersController < Public::ApplicationController
  before_action :post_find, except: [:update]
  before_action :customer_check, only: [:edit]

  def create
    @ansewer = Ansewer.new
    @ansewer_reply = Ansewer.new
    ansewer = current_customer.ansewers.new(ansewer_params)
    ansewer.post_id = @post.id
    if ansewer.save
      render :create
    else
      flash[:alert] = "投稿に失敗しました。"
      redirect_to post_path(@post)
    end
  end

  def edit
  end

  def update
    ansewer = Ansewer.find_by(id: params[:id], post_id: params[:post_id])
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
    @ansewer = Ansewer.new
    @ansewer_reply = Ansewer.new
    if Ansewer.find_by(id: params[:id], post_id: params[:post_id]).destroy
      render :destroy
    else
      flash[:alert] = "削除に失敗しました。"
      redirect_to post_path(params[:post_id])
    end
  end

  private

  def ansewer_params
    params.require(:ansewer).permit(:body, :parent_id, :best_ansewer)
  end

  def post_find
    @post = Post.find(params[:post_id])
  end

  def customer_check
    @ansewer = Ansewer.find_by(id: params[:id], post_id: params[:post_id])
    unless @ansewer.customer == current_customer
      flash[:alert] = "不正なアクセスの為ページに遷移できません"
      redirect_to post_path(@post)
    end
  end
end
