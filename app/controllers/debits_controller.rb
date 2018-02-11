class DebitsController < ApplicationController
  before_action :set_debit, only: %i[
    confirm_my_debit
    confirm_my_group_debit
    request_to_remove_my_debit
    request_to_remove_my_group_debit
    confirm_to_remove_debit
    cancel_debit_request
  ]
  before_action :verify_policy

  layout false, only: [:my_debits_for_print]

  def index
    @debits = Debit.page(params[:page])
  end

  # FOR ADMINS & RESPONSIBLES
  def request_debit
    product = Product.find(params[:product_id])
    return error(t(:debit_save_error)) if product.any_pending_debit? || !product.free?
    create_debit_request(product, params[:user_id], params[:group_id])
  end

  def cancel_debit_request
    return error(t(:debit_cancel_error)) unless @debit.pending? || @debit.start.nil?
    @debit.destroy
    redirect_to @debit.product, notice: t(:debit_cancel_success)
  end

  def confirm_to_remove_debit
    return error(t(:debit_remove_error)) if @debit.start.nil? || !@debit.pending?
    remove_debit
  end

  # FOR EVERYBODY
  def my_debits
    @my_debits = current_user.debits.page(params[:page])
    @my_groups_debits = Debit.where(group_id: current_user.groups.ids).page(params[:page])
  end

  def my_debits_for_print
    @my_debits = current_user.debits
    @my_groups_debits = Debit.where(group_id: current_user.groups.ids)
  end

  # Current user must be user of debit.
  def confirm_my_debit
    return redirect_to debits_my_debits_path if current_user != @debit.user
    confirm_debit
  end

  # Current user must be coordinator of associated group.
  def confirm_my_group_debit
    return redirect_to debits_my_debits_path if current_user != @debit.group.coordinator
    confirm_debit
  end

  def request_to_remove_my_debit
    return redirect_to debits_my_debits_path if current_user != @debit.user
    request_to_remove_debit
  end

  def request_to_remove_my_group_debit
    return redirect_to debits_my_debits_path if current_user != @debit.group.coordinator
    request_to_remove_debit
  end

  private

  def confirm_debit
    return redirect_to debits_my_debits_path unless @debit.pending? || @debit.start.nil?
    @debit.start = Date.current
    @debit.status = :active
    @debit.product.status = :busy
    @debit.product.save
    @debit.save
    redirect_to debits_my_debits_path
  end

  def create_debit_request(product, user_id, group_id)
    Debit.create(user_id: user_id, group_id: group_id, product: product, status: :pending)
    redirect_to product, notice: t(:debit_save_success)
  end

  def request_to_remove_debit
    return redirect_to debits_my_debits_path unless @debit.active?
    @debit.status = :pending
    @debit.save
    redirect_to debits_my_debits_path
  end

  def remove_debit
    @debit.end = Date.current
    @debit.status = :inactive
    @debit.product.status = :free
    @debit.product.save
    @debit.save
    redirect_to @debit.product, notice: t(:debit_remove_success)
  end

  def error(message)
    redirect_to @debit.product, alert: message
  end

  def verify_policy
    authorize self
  end

  def set_debit
    @debit = Debit.find(params[:debit_id])
  end
end
