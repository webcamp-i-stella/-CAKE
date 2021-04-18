class Admin::CustomersController < ApplicationController
  def index
    @customers = Customer.page(params[:page])
  end

  def show
    @customer = Customer.find(params[:id])
  end

  def edit
    @customer = Customer.find(params[:id])
  end

  def update
    customer = Customer.find(params[:id])
    customer.update(admin_customer_params)
    redirect_to admin_customer_path(customer)
  end

  private

  def admin_customer_params
    params.require(:customer).permit(:family_name, :first_name, :family_name_kana, :first_name_kana, :postal_code, :address, :phone, :email, :is_deleted)
  end
end
