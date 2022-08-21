class Public::CustomersController < ApplicationController
  def show
    if current_customer.email == 'guest@1111.com'
      redirect_to root_path, alert: 'ゲストユーザーはマイページを更新できません。'
    end
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    @customer.update(customer_params)
    redirect_to public_customer_path
  end

  def confirmation
  end

  def good
    @customer = current_customer
  end

  def withdrawal
    @customer = current_customer

    if @customer.email == 'guest@1111.com'
      redirect_to root_path, alert: 'ゲストユーザーは削除できません。'
    else
      @customer.update(is_deleted: true)
      reset_session
      sign_out current_customer
      redirect_to root_path
    end
  end

  private

  def customer_params
    params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :email, :encrypted_password, :postal_code, :address, :telephone_number, :is_deleted)
  end
end
