class Public::SearchController < ApplicationController

  def search
		@selected = params[:selected]
		@content = params[:content]
		@method = params[:method]
		@posts = Post.search_for(@selected, @content, @method).page(params[:page]).reverse_order
		@customer = current_customer
		if @selected == "title"
		  @selected = "タイトル"
		else
		   @selected = "本文"
		end
		render template: 'public/posts/index'
	end

end
