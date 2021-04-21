class Admin::ContactController < ApplicationController

  def index
    @notice_new = AdminNotice.new
    @notices = AdminNotice.all.page(params[:page]).reverse_order
  end

  def create
    @notice_new = AdminNotice.new(notice_params)
    if @notice_new.save
      flash[:notice] = "お知らせを追加しました"
      redirect_to admin_contact_index_path
    else
      flash[:alret] = "お知らせを追加できませんでした"
      @notices = AdminNotice.all.page(params[:page]).reverse_order
      render :index
    end
  end

  def show
    @notice = AdminNotice.find(params[:id])
  end

  def edit
    @notice = AdminNotice.find(params[:id])
  end

  def update
    @notice = AdminNotice.find(params[:id])
    if @notice.update(notice_params)
      flash[:notice] = "お知らせを変更しました"
      redirect_to contact_path
    else
      flash[:alret] = "変更に失敗しました"
      render :edit
    end
  end

  def destroy
    AdminNotice.find(params[:id]).destroy
    flash[:alert] = "お知らせを削除しました"
    redirect_to contact_path
  end

  private

  def notice_params
    params.require(:admin_notice).permit(:title_notice, :body_notice)
  end

end
