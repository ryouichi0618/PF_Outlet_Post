class Public::PostsController < Public::ApplicationController
  before_action :authenticate_customer!, except: [:index, :show]
  
  def index
  end
  
  def show
  end
end
