# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  before_action :customer_state, only: [:create]

  def guest_sign_in
    customer = Customer.guest
    sign_in customer
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end

  def current_customer_sign_in
    #customer = Customer.guest
    #sign_in customer
    redirect_to root_path, notice: 'がログインしました。'
  end

  # GET /resource/sign_in
  # def new
  #   super
  # end


  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  def after_sign_in_path_for(resource)
    root_path
  end
  def after_sign_out_path_for(resource)
    root_path
  end

  protected

def customer_state

  @customer = Customer.find_by(email: params[:customer][:email])
  return if !@customer

  if @customer.valid_password?(params[:customer][:password]) && @customer.is_deleted
    redirect_to  new_customer_session_path
  end
end
end
