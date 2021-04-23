class Public::ApplicationController  < ApplicationController
  before_action :authenticate_customer!, except: [:contact, :contact_show, :about]
  before_action :customer

  def customer
    @my_customer = current_customer
  end
end