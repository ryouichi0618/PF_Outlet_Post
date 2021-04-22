class Public::PostsController < Public::ApplicationController
  before_action :authenticate_customer!, except: [:index, :show]
  include ApplicationHelper

  def new
    @post = Post.new
  end


  def create
    @post = Post.new(post_params)
    @post.customer_id = current_customer.id
    if @post.save
      flash[:notice] = "投稿しました。"
      redirect_to root_path
    else
      flash[:alert] = "投稿に失敗しました。"
      render :new
    end
  end

  def index
    @posts = Post.all.page(params[:page]).reverse_order
    respond_to do |format|
      format.html
      format.js {render :index}
    end
  end

  def show
    @post = Post.find(params[:id])
    @ansewer = Ansewer.new
    @ansewer_reply = Ansewer.new
  end

  def update
    post = Post.find(params[:id])
    if post.update(best_params)
      # BestAnswerに選ばれた人にcountする処理
      ansewer = post.ansewers.find_by(id: post.best_ansewer)
      customer = ansewer.customer
      customer.best_ansewer_all = best_ansewer_all_count(customer)
      customer.best_ansewer_week = best_ansewer_week_count(customer)
      customer.update(customer_params)
      flash[:notice] = "BestAnswerを選択しました。"
      redirect_to post_path(post)
    else
      flash[:alert] = "BestAnswerを選択できませんでした。"
      redirect_to post_path(post)
    end
  end

  def destroy
    Post.find(params[:id]).destroy
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :image)
  end

  def best_params
    params.require(:post).permit(:best_ansewer)
  end

  def customer_params
    params.permit(:best_ansewer_all, :best_ansewer_week)
  end
end
