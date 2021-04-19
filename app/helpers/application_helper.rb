module ApplicationHelper
  
  # 会員がベストアンサーに選ばれた数の計算
  def best_ansewer_all_count(customer)
    customer.best_ansewer_all += 1
  end
  
  def best_ansewer_week_count(customer)
    customer.best_ansewer_week += 1
  end
  
end
