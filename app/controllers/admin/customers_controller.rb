class Admin::CustomersController < ApplicationController

  def index
    @customers = Customer.all.page(params[:page])
  end

  def show
    @customer = Customer.find(params[:id])
    @posts = @customer.posts.page(params[:page]).reverse_order.per(4)
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    current_admin && !current_customer
     @customer = Customer.find(params[:id])
    if @customer.update(customer_params)
      flash[:notice] = "会員情報を更新しました。"
      redirect_to admin_customer_path(@customer)
    else
      flash[:alert] = "会員情報を更新に失敗しました。"
      render :edit
    end
  end

  def withdraw
    current_admin && !current_customer
    @customer = Customer.find(params[:id])
    if @customer.is_delete == false
      @customer.update(is_delete: true)
      flash[:alert] = "会員を強制退会させました。"
    else
      @customer.update(is_delete: false)
      flash[:notice] = "会員情報を復旧させました。"
    end
    redirect_to admin_customers_path
  end

  private

  def customer_params
    params.require(:customer).permit(:nickname, :email, :last_name, :first_name, :last_name_kana, :first_name_kana, :profile_image, :info)
  end


end
