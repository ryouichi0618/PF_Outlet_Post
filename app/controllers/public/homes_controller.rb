class Public::HomesController < Public::ApplicationController
  def about
  end

  def contact
    @notices = AdminNotice.all.page(params[:page]).reverse_order
    respond_to do |format|
      format.html
      format.js { render :index }
    end
  end

  def contact_show
    @notice = AdminNotice.find(params[:id])
  end
end
