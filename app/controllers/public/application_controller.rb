class Public::ApplicationController  < ApplicationController
  before_action :authenticate_customer!, except: [:contact, :contact_show, :about]
  before_action :customer

  def customer
    @customer = current_customer
  end
end