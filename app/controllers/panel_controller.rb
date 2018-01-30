class PanelController < ApplicationController
  before_action :verify_policy
  before_action(
    :verify_debit,
    only: %i[confirm_my_debit confirm_debit_of_my_group]
  )

  def index; end

  def users
    @users = User.page(params[:page])
  end

  def user
    return redirect_to users_path unless User.exists?(params[:id])
    @user = User.find(params[:id])
    @debits = Debit.where(user: @user)
  end

  def my_debits
    @my_debits = current_user.debits.page(params[:page])
    @my_groups_debits = Debit.where(group_id: current_user.groups.ids).page(params[:page])
  end

  def debits
    @debits = Debit.page(params[:page])
  end

  def logs
    @logs = PublicActivity::Activity.page(params[:page])
  end

  def confirm_my_debit
    debit = Debit.find(params[:debit_id])
    return redirect_to my_debits_path if debit.user != current_user
    confirm_debit(debit)
  end

  def confirm_debit_of_my_group
    debit = Debit.find(params[:debit_id])
    return redirect_to my_debits_path unless
    current_user.groups.include?(debit.group)
    confirm_debit(debit)
  end

  private

  def confirm_debit(debit)
    return redirect_to my_debits_path unless debit.pending?
    update_debit(debit)
    redirect_to my_debits_path
  end

  def update_debit(debit)
    if debit.start.nil?
      debit.start = Date.current
      debit.status = :active
      debit.product.update_attribute(:status, :busy)
    else
      debit.end = Date.current
      debit.status = :inactive
      debit.product.update_attribute(:status, :free)
    end
    debit.save
  end

  def verify_debit
    return redirect_to my_debits_path unless Debit.exists?(params[:debit_id])
  end

  def verify_policy
    authorize self
  end
end
