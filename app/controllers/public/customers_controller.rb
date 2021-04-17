class Public::CustomersController < Public::ApplicationController
  def show
    @customer = Customer.find(params[:id])
    @posts = @customer.posts.page(params[:page]).reverse_order.per(4)
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:notice] = "会員情報を更新しました。"
      redirect_to customer_path(customer)
    else
      flash[:alert] = "会員情報を更新に失敗しました。"
      render :edit
    end
  end

  def unsubscribe
  end

  def withdraw
  end

  def post_index
  end

  def ansewers
  end

  private

  def customer_params
    params.require(:customer).permit(:nickname, :email, :last_name, :first_name, :last_name_kana, :first_name_kana, :profile_image, :info)
  end
end
