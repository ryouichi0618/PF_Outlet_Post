class Public::BestAnsewersController < Public::ApplicationController

  def ranks_all
    @customers_all = Customer.where.not(is_delete: true).order(best_ansewer_all: :desc)
  end

  def ranks_week
    @customers_week = Customer.where.not(is_delete: true).order(best_ansewer_week: :desc)
  end

end
