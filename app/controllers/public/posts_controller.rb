class Public::PostsController < Public::ApplicationController
  before_action :authenticate_customer!, except: [:index, :show]
  
  def new 
    @post = Post.new
  end 
  
  def create 
  end 
  
  def index
  end
  
  def show
  end
  
  def destroy 
  end
end
