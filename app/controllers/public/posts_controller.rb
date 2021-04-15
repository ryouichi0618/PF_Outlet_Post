class Public::PostsController < Public::ApplicationController
  before_action :authenticate_customer!, except: [:index, :show]

  def new
    @post = Post.new
  end


  def create
    post = Post.new(post_params)
    post.customer_id = current_customer.id
    post.save
    redirect_to root_path
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    # @best_ansewer = Ansewer.find(params[:id])
    @ansewer = Ansewer.new
    @ansewer_reply = Ansewer.new

  end

  def update
    post = Post.find(params[:id])
    post.update(best_params)
    redirect_to post_path(post)
  end

  def destroy
    Post.find(params[:id]).destroy
    redirect_to root_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :image, :best_ansewer)
  end

  def best_params
    params.require(:post).permit(:best_ansewer)
  end
end
