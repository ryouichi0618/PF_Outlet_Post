class Batch::DataReset
  def self.data_reset
    customers = Customer.all
    customers.each do |customer|
      customer.update(best_ansewer_week: 0)
    end
    p "週間のベストアンサー数をリセットしました"
  end
end
