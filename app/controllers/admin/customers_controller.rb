class Admin::CustomersController < ApplicationController
  before_action :authenticate_customer
  def index
    @customers=Customer.page(params[:page]).per(4)
  end

  def show
    @customer=Customer.find(params[:id])
  end

  def edit
    @customer=Customer.find(params[:id])
  end

  def update
    @customers = Customer.find(params[:id])
    @customers.update(customer_params)
    redirect_to admin_customer_path(@customers.id)
  end

  def destroy
    @customer= Customer.find(params[:id])
    @customer.destroy
    redirect_to admin_customers_path
  end

  private
  
  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :encrypted_password, :postal_code, :address, :telephone_number, :nickname, :is_deleted)
  end
end
