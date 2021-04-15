class Public::PostReactionsController < Public::ApplicationController

  def new
    @post = Post.find_by(id: params[:post_id])
    @ansewer = Ansewer.find(params[answer.id])
    # @ansewer = Ansewer.find_by(post_id: params[:post_id], id: params[:id])
    @reaction = Reaction.new
    @reaction.customer_id = current_customer.id
    binding.pry
    # @reaction = @ansewer.reactions.build(customer_id: current_customer.id)
  end

  def create
  end

  def destroy
  end


end
