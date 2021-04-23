class Admin::SearchController < ApplicationController
  def search
    @selected = params[:selected]
    @content = params[:content]
    @method = params[:method]
    if params[:selected] == ("title" || "content")
      @posts = Post.search_for(@selected, @content, @method).page(params[:page]).reverse_order
      @customer = current_customer
      if @selected == "title"
        @selected = "タイトル"
      else
        @selected = "本文"
      end
      render template: 'admin/posts/index'
    else
      @customers = Customer.search_for(@selected, @content, @method)
      @customers.page(params[:page]).reverse_order
      if @selected == "nickname"
        @selected = "ニックネーム"
      else
        @selected == "紹介文"
      end
      render template: 'admin/customers/index'
    end
  end
end
